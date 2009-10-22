Received: from [203.97.33.68] (helo=smtp5.clear.net.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthew@4d-electronics.co.nz>) id 1N14qs-0003jX-HM
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 23:05:45 +0200
Received: from tardis.4d-electronics.co.nz
	(202-0-56-223.cable.telstraclear.net [202.0.56.223])
	by smtp5.clear.net.nz (CLEAR Net Mail)
	with ESMTP id <0KRX00EHTP6MDP20@smtp5.clear.net.nz> for
	openembedded-devel@lists.openembedded.org; Fri,
	23 Oct 2009 10:03:59 +1300 (NZDT)
Received: from localhost (localhost [127.0.0.1])	by tardis.4d-electronics.co.nz
	(Postfix) with ESMTP id C55795CE277	for
	<openembedded-devel@lists.openembedded.org>; Fri,
	23 Oct 2009 10:03:58 +1300 (NZDT)
Received: from tardis.4d-electronics.co.nz ([127.0.0.1])
	by localhost (tardis.4d-electronics.co.nz [127.0.0.1])
	(amavisd-new, port 10024)	with ESMTP id CjaBreCNcYH0	for
	<openembedded-devel@lists.openembedded.org>; Fri,
	23 Oct 2009 10:03:58 +1300 (NZDT)
Received: from [192.168.1.130] (unknown [192.168.1.130])
	by tardis.4d-electronics.co.nz (Postfix) with ESMTPS id 3FCA45CE05B	for
	<openembedded-devel@lists.openembedded.org>; Fri,
	23 Oct 2009 10:03:58 +1300 (NZDT)
Date: Fri, 23 Oct 2009 10:03:58 +1300
From: Matthew Dombroski <matthew@4d-electronics.co.nz>
In-reply-to: <1256216911-693-1-git-send-email-valentin.longchamp@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Message-id: <4AE0C8BE.6090300@4d-electronics.co.nz>
MIME-version: 1.0
X-Virus-Scanned: by Amavis+SpamAssassin+ClamAV and more at	4d-electronics.co.nz
References: <1256216911-693-1-git-send-email-valentin.longchamp@epfl.ch>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.1) Gecko/20090715
	Thunderbird/3.0b3
X-SA-Exim-Connect-IP: 203.97.33.68
X-SA-Exim-Mail-From: matthew@4d-electronics.co.nz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Cmake cross-compile file
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
X-List-Received-Date: Thu, 22 Oct 2009 21:05:46 -0000
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit

>
> I had already posted this patch earlier bit I got no comment. It allows cmake
> to work with cross-compile files where the needed paths, options and programs
> are given, which is the recommended way of doing cross-compilation with cmake
> according to their documentation.
>
> Furthermore, you can add additionnal path in individual recipes by writing into
> the cross-compile file in the do_generate_toolchain_file_append() task as done
> below for qt4 for instance.
>
>
>
> I have been using it in my overlay for quite some time with various cmake based
> recipes we have here and I definitely think it would deserve OE inlcusion.
>
>    

I have been using the same system for cmake too, with one small change - 
I have made the toolchain path configurable.
OECMAKE_TOOLCHAIN_FILE ?= "${WORKDIR}/toolchain.cmake"

~Matthew



