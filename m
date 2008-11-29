Received: from [209.85.221.22] (helo=mail-qy0-f22.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <daierxin@gmail.com>) id 1L6OMk-0008Qy-67
	for openembedded-devel@openembedded.org; Sat, 29 Nov 2008 12:52:02 +0100
Received: by qyk3 with SMTP id 3so424113qyk.12
	for <openembedded-devel@openembedded.org>;
	Sat, 29 Nov 2008 03:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type;
	bh=NEPup8HU9dYTaWiLejk5zit46tlTPfY1M/jqwQEq6wo=;
	b=leXEphz/Eb1dmuwuzpYcLMXNHgCYLOLIzD1rbDaAXGo0sQmjv/+aBuzxINRtJdctyI
	+0QrGM41fHop0OBD6KTA17UnEAkqDvffXoCkN3+UG8SuFlY3CYiqj08hvAFZA5Cbp7j4
	1rUWu5fVWyCR2piMwNGMRlIZWQoAYWCCTa5pk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type;
	b=nEsz9Dbnh5pTrf+wMt4S99Y1oLvIR/wNgpoAMwgb/TrT0EuFTR6xpTOM6hpjdEc7cR
	jRO1jpYuG6qeKVlXc+urVHwRAJ+0Vwy6JXaUMIr+9l0ms9agcAvCgZXDzXCFPL4cpWqu
	5QmJYc/b1AqPrA1ZeV0BYZOU/mh7SL/3/uTrw=
Received: by 10.103.121.19 with SMTP id y19mr3567951mum.56.1227959041256;
	Sat, 29 Nov 2008 03:44:01 -0800 (PST)
Received: by 10.103.179.19 with HTTP; Sat, 29 Nov 2008 03:44:01 -0800 (PST)
Message-ID: <8f4584b50811290344w166abf78m294ab5132b72d278@mail.gmail.com>
Date: Sat, 29 Nov 2008 19:44:01 +0800
From: "=?GB2312?B?tPq2+9DA?=" <daierxin@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: sanity test problems at end of build
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
X-List-Received-Date: Sat, 29 Nov 2008 11:52:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello..,
   I also met this problem. In may case, from  the log:

ERROR: QA Issue: paragui.pc failed sanity check
....
>> QA staging was broken by the package built above
>> ERROR: Error in executing:
>> ERROR: Exception:<type 'exceptions.SystemExit'>  Message:1
>> ERROR: Printing the environment of the function


if it is because the file paragui.pc:

prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include
Name: ParaGUI
Description: cross-platform widget library
Version: 1.1.8
Libs: -lparagui -lsigc-1.2   -L/usr/lib -Wl,-rpath,/usr/lib -lSDL -lpthread
-lexpat -lfreetype -lz  -lstdc++
Cflags: -I/usr/lib/sigc++-1.2/include -I/usr/include/sigc++-1.2
-I/usr/include/freetype2 -I/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT
After some debug, I found if I remove below lines from paragui.pc

Libs: -lparagui -lsigc-1.2   -L/usr/lib -Wl,-rpath,/usr/lib -lSDL -lpthread
-lexpat -lfreetype -lz  -lstdc++
Cflags: -I/usr/lib/sigc++-1.2/include -I/usr/include/sigc++-1.2
-I/usr/include/freetype2 -I/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT

The error is gone. But I don't think it is a correct fix. Because some
packages may use pkgconfig with this file. To find the clue, I have question
about this error, hope someone can answer me.

Q:
1. What is the purpose of the QA sanity check? And How this check do?

2. Just a guess, QA sanity check, Is it for checking the lib or include file
installed correctly base on the .pc file or the .la(mail in Valentin
Longchamp)? If it is, I think the error is in the bb files or Makefile in
the package, it can't install the lib correctly.

Best Regards.

