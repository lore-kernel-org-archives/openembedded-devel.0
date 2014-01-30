Return-Path: <nickdademo@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id A064C6E9BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 11:58:08 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id va2so3300921obc.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 03:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=EQ3XW56NvqoqI35RP+UbtyCWZfENa6h0L8Oip8+C2bE=;
	b=si2n3fMn+uL30bb90L0yQLr9yK6WW/hYK9Ck8dK99mLb9JUFNl9398q9yPe/Q/EBFl
	DRVODfL/jmm1vPXrfmPre1Gb8IPW5HlnPj2CS6ka/vclMtYAV6Kd5+8nbvzZLvvhrVJV
	W/qElJzU6c4CYEzK3l4vzi5DQ935+bS+8HA1wLKHKbD9884KtkUHswmg2OGp9r/qczwF
	/UIeADs0bRhJcGKWeiRQ+zUYMu3vJv07PTI02UWbzSsypbTFwjHwls+nkjUuCtSPya98
	8pQVUgbBtiAiKSXfyYDaLxSl0a0TjWjfAcIpbE6BYztkXsPxjM2GP5ubARJWJ+Q5FNIX
	hxyQ==
X-Received: by 10.60.134.200 with SMTP id pm8mr10965497oeb.40.1391083089252;
	Thu, 30 Jan 2014 03:58:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.79.165 with HTTP; Thu, 30 Jan 2014 03:57:49 -0800 (PST)
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Thu, 30 Jan 2014 22:57:49 +1100
Message-ID: <CANR6C54WmokZxiFHThuXkZ-kiocewgnGVg7AtbH=FHjr1AFHsg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: tk 8.6.0: strange error: "oe_runmake: command not found"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2014 11:58:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm encountering a strange error at the install step with the tk 8.6.0
recipe (full log below). Does anyone have any ideas on this?
This recipe was compiling fine before (and has not been recently changed -
last change Dec 5 2013) so I'm not sure what has broken it...

Thanks,
Nick

ERROR: Function failed: do_install (log file is located at
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831)
> ERROR: Logfile of failure stored in:
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> 'bit-64', 'x86_64-linux', 'common']
> | DEBUG: Executing shell function do_install
> |
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/run.do_install.1831:
> line 269: oe_runmake: command not found
> | WARNING:
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/run.do_install.1831:1
> exit 127 from
> |   oe_runmake
> 'DESTDIR=/home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/image'
> install
> | ERROR: Function failed: do_install (log file is located at
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/tk/8.6.0-r0/temp/log.do_install.1831)
> ERROR: Task 2098
> (/home/nick/poky/meta-openembedded/meta-oe/recipes-devtools/tcltk/
> tk_8.6.0.bb, do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 6752 tasks of which 6751 didn't need to be
> rerun and 1 failed.
> No currently running tasks (2879 of 6817)
>
> Summary: 1 task failed:
>   /home/nick/poky/meta-openembedded/meta-oe/recipes-devtools/tcltk/
> tk_8.6.0.bb, do_install
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>

