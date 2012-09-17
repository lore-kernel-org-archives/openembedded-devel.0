Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TDbls-00080a-7O
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 15:53:56 +0200
Received: by iebc11 with SMTP id c11so9900644ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 06:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=dHK8E/JnyPgXPjvtZuYBAQYZPwrvFw98Q2wACz/QggQ=;
	b=chKKoo0ZXm8QH2Am2WwLUdGRQShsaon5Td8th1vtJ6Za5TTPtC/SNuhvjPMvC9+7Jy
	zjTB+f2u1JIX6EJq1zDCHTgrwegmQLG17u5ZQWNMfhNX1fOl16Tik/JmtYleOpC5CbB7
	h/22JANNchSZHBvV/ueGZb2sjemOt63VVS3kjw2FqBlrpCqApC62nZNd4+fCCUzHhOpK
	lqbjQASHjLJ6mJNbxb/X930aRrvNI7pqrsgjlKvSM9rmYYXxLfwBUDoSw8uqXgB0/vXf
	JIbVc9h3aWc2a5TeRq1IqqA3g7awL818YaYIiD28mcL1ghzjgcZ0GwyuGMN/DK2n+Sa0
	EMUw==
MIME-Version: 1.0
Received: by 10.50.135.72 with SMTP id pq8mr6763000igb.53.1347889276975; Mon,
	17 Sep 2012 06:41:16 -0700 (PDT)
Received: by 10.64.162.226 with HTTP; Mon, 17 Sep 2012 06:41:16 -0700 (PDT)
In-Reply-To: <CAJTo0Lav6fEbsZkz2eh+u6OLAP+-yEEMnrj7qeG3K1h9FxYAQA@mail.gmail.com>
References: <CALEMqRG1qnHH-whuSm4fhB9x3jS4qS=6wukswge0phcWoOWG9A@mail.gmail.com>
	<CAJTo0Lav6fEbsZkz2eh+u6OLAP+-yEEMnrj7qeG3K1h9FxYAQA@mail.gmail.com>
Date: Mon, 17 Sep 2012 15:41:16 +0200
Message-ID: <CA+chaQdDY9SOHA3w5dY9pRyq_AhvJ9vTk66QNj9X=veoH--pbA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: package gobject-introspection-native-0.9.10-r1: task do_compile: Failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 13:53:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 17, 2012 at 3:31 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 17 September 2012 14:13, Lucas <lucas.gerads@gmail.com> wrote:
>> symbol lookup error: /usr/lib/libgirepository-1.0.so.1: undefined symbol:
>> g_mutex_lock
>
> /usr/lib?  Broken build environment, that's picking up dependencies
> (libgirepository, but the look of it) from the host instead of inside
> the build.
>
> But that's not the problem.  The *real* problem is that
> gobject-instrospection doesn't work when cross-compiling.  oe-core
> master has a gtk-doc-stub package that also doubles as a
> gobject-introspection-stub, so I recommend pulling that in/using it
> and changing any gobject-introspection-native dependencies to
> gobject-instrospection-stub.
>
> Ross

From recipe path it looks like he is using OE-classic and he is not
building target gobject-instrospection but
gobject-instrospection-native which should work.

I guess distro has newer glib which needs added #include or
glib-2.0-native dependency.

Cheers,


