Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 139507C2E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 17:26:02 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 8AF8A5C078F;
	Fri, 25 Jan 2019 18:26:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1548437163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=5usW/vvneBQw8XJuhUCjNUqQ9cP8YB+Daf+HwTl3CtM=;
	b=T6e/JLleeg60PsyTzzlfWHIl1e+1gS5/817JO7Neem0gTIcp2fpUZ51263C++S1DiRh0vQ
	Ba7CeFLzxXJj9xLBl/zQvJYDLPoHD98KJpLsl7PdwEUkD5q0F+9vaKui0hLQzVwAsmV1fP
	2G278fw0HlaqElpqCoEPOXb9U/ChUG4=
MIME-Version: 1.0
Date: Fri, 25 Jan 2019 18:26:03 +0100
From: Stefan Agner <stefan@agner.ch>
To: Mike Looijmans <mike.looijmans@topic.nl>
In-Reply-To: <c0e76ec3-4cc9-38cc-bdac-eadd69eab14a@topic.nl>
References: <4f3f8463750770c686b010b7270351b2@agner.ch>
	<c0e76ec3-4cc9-38cc-bdac-eadd69eab14a@topic.nl>
Message-ID: <afcb2f61ca3adfef2e312fc3b8f23215@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Python3 bytecode is stale
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2019 17:26:03 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 25.01.2019 15:35, Mike Looijmans wrote:
> Most likely the date/time stamps on the files are such that the "py" files 
> appear to be newer.

Indeed, this seems to be the issue. We are using OSTree, which removes
mtimes. Ricardo (now on CC) also pointed me to the relevant issue in
OSTree:
https://github.com/ostreedev/ostree/issues/1469

> 
> A very simple fix would be to simply delete the ".py" files, they aren't 
> really needed anyway so you'll save a lot of space in the process.
> 
> To do this compile-time, you could add something like this in a bbappend:
> PACKAGES =+ "${PN}-src"
> FILES_${PN}-src = "{installdir}/*.py {installdir}/*/*.py"
> 
> That'll push the "py" files into another package and prevent them being 
> installed by default. Change "{installdir}" into something more appropriate.
> Of just delete them in a do_install_append.

Hm, interesting idea, will give this a try.

Wouldn't be something like this be a nice OpenEmbedded addition in
general? Optimizing embedded rootfs size by deleting py files seems to
be a common use case.

In a simple test deleting all py files on my rootfs did not go well (the
application does not start anymore). I need to investigate further.

--
Stefan

> 
> 
> On 25-01-19 14:46, Stefan Agner wrote:
>> Hi,
>>
>> Recently I noticed that Python3 programs got rather slow. Running the
>> test application took 12.5 seconds. We are using a read-only file system
>> and I immediately suspected the bytecode cache. After mounting the
>> rootfs rw, from the second execution on running the test application
>> took below 4 seconds.
>>
>> By simply executing a Hello World, Python declares all code objects as
>> being stale and tries to rewrite them:
>>
>> # python3 -v -c 'print("Hello World")'
>> import _frozen_importlib # frozen
>> import _imp # builtin
>> import sys # builtin
>> import '_warnings' # <class '_frozen_importlib.BuiltinImporter'>
>> import '_thread' # <class '_frozen_importlib.BuiltinImporter'>
>> import '_weakref' # <class '_frozen_importlib.BuiltinImporter'>
>> import '_frozen_importlib_external' # <class
>> '_frozen_importlib.FrozenImporter'>
>> import '_io' # <class '_frozen_importlib.BuiltinImporter'>
>> import 'marshal' # <class '_frozen_importlib.BuiltinImporter'>
>> import 'posix' # <class '_frozen_importlib.BuiltinImporter'>
>> import _thread # previously loaded ('_thread')
>> import '_thread' # <class '_frozen_importlib.BuiltinImporter'>
>> import _weakref # previously loaded ('_weakref')
>> import '_weakref' # <class '_frozen_importlib.BuiltinImporter'>
>> # installing zipimport hook
>> import 'zipimport' # <class '_frozen_importlib.BuiltinImporter'>
>> # installed zipimport hook
>> # bytecode is stale for 'encodings'
>> # code object from /usr/lib/python3.5/encodings/__init__.py
>> # could not create
>> '/usr/lib/python3.5/encodings/__pycache__/__init__.cpython-35.pyc':
>> OSError(30, 'Read-only file system')
>> # wrote
>> '/usr/lib/python3.5/encodings/__pycache__/__init__.cpython-35.pyc'
>> # bytecode is stale for 'codecs'
>> # code object from /usr/lib/python3.5/codecs.py
>> # could not create
>> '/usr/lib/python3.5/__pycache__/codecs.cpython-35.pyc': OSError(30,
>> 'Read-only file system')
>> # wrote '/usr/lib/python3.5/__pycache__/codecs.cpython-35.pyc'
>> import '_codecs' # <class '_frozen_importlib.BuiltinImporter'>
>> import 'codecs' # <_frozen_importlib_external.SourceFileLoader object at
>> 0xb6b33130>
>> # bytecode is stale for 'encodings.aliases'
>> # code object from /usr/lib/python3.5/encodings/aliases.py
>> # could not create
>> '/usr/lib/python3.5/encodings/__pycache__/aliases.cpython-35.pyc':
>> OSError(30, 'Read-only file system')
>> # wrote
>> '/usr/lib/python3.5/encodings/__pycache__/aliases.cpython-35.pyc'
>> import 'encodings.aliases' #
>> <_frozen_importlib_external.SourceFileLoader object at 0xb6b3d9d0>
>> import 'encodings' # <_frozen_importlib_external.SourceFileLoader object
>> at 0xb6b154b0>
>> # bytecode is stale for 'encodings.ascii'
>> # code object from /usr/lib/python3.5/encodings/ascii.py
>> # could not create
>> '/usr/lib/python3.5/encodings/__pycache__/ascii.cpython-35.pyc':
>> OSError(30, 'Read-only file system')
>> # wrote '/usr/lib/python3.5/encodings/__pycache__/ascii.cpython-35.pyc'
>> import 'encodings.ascii' # <_frozen_importlib_external.SourceFileLoader
>> object at 0xb6b3db10>
>> import '_signal' # <class '_frozen_importlib.BuiltinImporter'>
>> ....
>>
>>
>> This is on a Armv7 device. OpenEmbedded layers are current master.
>> Python version is 3.5.6. Is this a known issue? Any idea?
>>
>> --
>> Stefan
>>

