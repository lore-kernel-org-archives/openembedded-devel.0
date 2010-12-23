Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PVfqJ-0005FT-3Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 08:44:08 +0100
Received: by iwn8 with SMTP id 8so6152605iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 23:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=YumEHnJF7u/kRXohTqhXXdQecw4onXbpuLMnef1U/XI=;
	b=ktFpE3j1THoCHWc6qhll1kb8dKo075xd1Db/LEb+QzTDDz+lmRXfQ86Gpa77CUat9a
	9/wsFY2+JuFb2ONj0byNLiZ8eW5fia7kLuC/TLm/7b3D4S0DwltJKK2TFT1OYMXKuKj5
	hXAutW1tuzq33UdBAC3yATSU60g1XjiklaeJo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=S6JnLXM95UZek10lUFpt1DZ9jXY72XMQbYAmGLFdoGLZNdc4Dlf9kmg4JtcJYW6Ny9
	iWB1s+CtRZQvKMJR362ygrBxyaEFwshYUWMBhhpur5aYxVTRAUK4h7HcqWuhG/YD0iAA
	YQjxlMG7Qlnn1azcguc1mn2AJOb6rU0ZhKWvU=
MIME-Version: 1.0
Received: by 10.231.37.136 with SMTP id x8mr7768848ibd.132.1293090239599; Wed,
	22 Dec 2010 23:43:59 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 22 Dec 2010 23:43:59 -0800 (PST)
In-Reply-To: <AANLkTinhwtWJfCFLWdB_QFVMWBYZi1G_C6sPt-qCAL8n@mail.gmail.com>
References: <AANLkTinhwtWJfCFLWdB_QFVMWBYZi1G_C6sPt-qCAL8n@mail.gmail.com>
Date: Thu, 23 Dec 2010 08:43:59 +0100
Message-ID: <AANLkTimGtgXwtoTS94WHRdNsgShmSkCxj25o6MnVfgHx@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: QA issue with staging (workdir) for .la files in xmlrpc-c package
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
X-List-Received-Date: Thu, 23 Dec 2010 07:44:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/23 Martin Panter <vadmium+floss@gmail.com>:
> Hi all
>
> I'm having trouble building "xmlrpc-c", which I think is required for
> rtorrent. It's failing at the "do_qa_staging" stage with the messages
> such as "QA Issue with staging: libxmlrpc.la failed sanity test
> (workdir)".
>
> I gather the issue is that my sysroots/*/usr/lib/libxmlrpc.la file has
> the following, which mentions the tmp/work/ directory:
>
> # Libraries that this one depends upon.
> dependency_libs=' -L.libs
> -L/media/disk/home/vadmium/proj/aegle/build/tmp/work/armv7a-angstrom-linux-gnueabi/xmlrpc-c-1.06.41-r1/xmlrpc-c-1.06.41/src/../lib/libutil/.libs
> -lxmlrpc_util -lxml2 -lz -lm'
>
> So looks like another Libtool issue. But I'm stuck this time so if
> anyone has any hints that would be awesome. For instance why does that
> -L. . ./tmp/work/. . . component get there, and perhaps is there some
> Libtool option to prevent or fix it?
>
> I think the xmlrpc-c packages has its own version of Libtool (1.3.4?).
> I tried coaxing the build process to use OE's Libtool version
> (EXTRA_OEMAKE = "LIBTOOL='${HOST_SYS}-libtool'", after the import
> line, in the recipe file), but this didn't seem to help.
>
> Previously I thought I had another "QA issue" with this xmlrpc-c
> package, something about a "hash style", which I thought I solved by
> passing LADD='${LDFLAGS}' to the Make command. But recently when I
> removed this change I am not getting the earlier "hash style QA
> issue"; only this newer "workdir" one. But I may be confused.
>
> -Martin
>
> These are the full messages taken straight from log.do_qa_staging file
> with awesome-long path names:
>
> ERROR: QA Issue with staging: libxmlrpc.la failed sanity test
> (workdir) in path
> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> ERROR: QA Issue with staging: libxmlrpc_server_abyss.la failed sanity
> test (workdir) in path
> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> ERROR: QA Issue with staging: libxmlrpc_server.la failed sanity test
> (workdir) in path
> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> ERROR: QA Issue with staging: libxmlrpc_server_cgi.la failed sanity
> test (workdir) in path
> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> ERROR: QA Issue with staging: libxmlrpc_client.la failed sanity test
> (workdir) in path
> /media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> FATAL: QA staging was broken by the package built above
>
> _______________________________________________


I *think* I've rebuild rtorrent yesterday. for beagleboard/minimal.
Didn't get the error. Can't verify things right now. Feel frree to
ping me this evening on irc (roughly 18.00-22.00 gmt) or tomorrow
during the day)
What libtool are you using? and is this on git head ?

Frans


