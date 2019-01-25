Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id C36456BCA4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 13:46:34 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 2CE755C1428
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 14:46:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1548423995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=uJFVZguGTTKsoXRSyA2u291+PaEizsgngugXShsuO1Q=;
	b=k3SlPCftQihadGg6fbVlMeYVi4gq2btgkHyWQs0D5Bcz94A0N1YJOEs2MrIgt9DEiTCYfN
	VzaU6PFqmccDJpaGf+Rt6SXPLw1ps2qlj2ibdD7uc4WHkuiuSl9KQpn30iLyoheVt6XK8M
	cx2cK/v/nNgD4L0gtwlGVQB7SGWPXPU=
MIME-Version: 1.0
Date: Fri, 25 Jan 2019 14:46:35 +0100
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Message-ID: <4f3f8463750770c686b010b7270351b2@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
Subject: Python3 bytecode is stale
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
X-List-Received-Date: Fri, 25 Jan 2019 13:46:35 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Recently I noticed that Python3 programs got rather slow. Running the
test application took 12.5 seconds. We are using a read-only file system
and I immediately suspected the bytecode cache. After mounting the
rootfs rw, from the second execution on running the test application
took below 4 seconds.

By simply executing a Hello World, Python declares all code objects as
being stale and tries to rewrite them:

# python3 -v -c 'print("Hello World")'
import _frozen_importlib # frozen
import _imp # builtin
import sys # builtin
import '_warnings' # <class '_frozen_importlib.BuiltinImporter'>
import '_thread' # <class '_frozen_importlib.BuiltinImporter'>
import '_weakref' # <class '_frozen_importlib.BuiltinImporter'>
import '_frozen_importlib_external' # <class
'_frozen_importlib.FrozenImporter'>
import '_io' # <class '_frozen_importlib.BuiltinImporter'>
import 'marshal' # <class '_frozen_importlib.BuiltinImporter'>
import 'posix' # <class '_frozen_importlib.BuiltinImporter'>
import _thread # previously loaded ('_thread')
import '_thread' # <class '_frozen_importlib.BuiltinImporter'>
import _weakref # previously loaded ('_weakref')
import '_weakref' # <class '_frozen_importlib.BuiltinImporter'>
# installing zipimport hook
import 'zipimport' # <class '_frozen_importlib.BuiltinImporter'>
# installed zipimport hook
# bytecode is stale for 'encodings'
# code object from /usr/lib/python3.5/encodings/__init__.py
# could not create
'/usr/lib/python3.5/encodings/__pycache__/__init__.cpython-35.pyc':
OSError(30, 'Read-only file system')
# wrote
'/usr/lib/python3.5/encodings/__pycache__/__init__.cpython-35.pyc'
# bytecode is stale for 'codecs'
# code object from /usr/lib/python3.5/codecs.py
# could not create
'/usr/lib/python3.5/__pycache__/codecs.cpython-35.pyc': OSError(30,
'Read-only file system')
# wrote '/usr/lib/python3.5/__pycache__/codecs.cpython-35.pyc'
import '_codecs' # <class '_frozen_importlib.BuiltinImporter'>
import 'codecs' # <_frozen_importlib_external.SourceFileLoader object at
0xb6b33130>
# bytecode is stale for 'encodings.aliases'
# code object from /usr/lib/python3.5/encodings/aliases.py
# could not create
'/usr/lib/python3.5/encodings/__pycache__/aliases.cpython-35.pyc':
OSError(30, 'Read-only file system')
# wrote
'/usr/lib/python3.5/encodings/__pycache__/aliases.cpython-35.pyc'
import 'encodings.aliases' #
<_frozen_importlib_external.SourceFileLoader object at 0xb6b3d9d0>
import 'encodings' # <_frozen_importlib_external.SourceFileLoader object
at 0xb6b154b0>
# bytecode is stale for 'encodings.ascii'
# code object from /usr/lib/python3.5/encodings/ascii.py
# could not create
'/usr/lib/python3.5/encodings/__pycache__/ascii.cpython-35.pyc':
OSError(30, 'Read-only file system')
# wrote '/usr/lib/python3.5/encodings/__pycache__/ascii.cpython-35.pyc'
import 'encodings.ascii' # <_frozen_importlib_external.SourceFileLoader
object at 0xb6b3db10>
import '_signal' # <class '_frozen_importlib.BuiltinImporter'>
....


This is on a Armv7 device. OpenEmbedded layers are current master.
Python version is 3.5.6. Is this a known issue? Any idea?

--
Stefan

