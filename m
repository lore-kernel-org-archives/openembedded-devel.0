Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nathansamson@gmail.com>) id 1Rvb7a-00027H-P2
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 22:01:39 +0100
Received: by vbbff1 with SMTP id ff1so1495081vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 12:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Vnnd9XVO11/RRgm4/Yxg7u/zf2zFMulWwqwr+3PQhyc=;
	b=ZXn/qCeiYCXTPAwMAxolGkF4eBSMa9o/2ItSLYXudUuc2Oms4/ETSW/QJPuwvqpCSm
	d9ZB076a7tjQFbzDkBo8z8LYRY2BBy8O6eAcOZJ7Bor7YFwx6vgPkxVIBePdY4ytG3P3
	GdB5ShUpSACTrkFGrz9mVe/0binDzdGrsAlAw=
Received: by 10.220.116.70 with SMTP id l6mr1524051vcq.55.1328820813267; Thu,
	09 Feb 2012 12:53:33 -0800 (PST)
MIME-Version: 1.0
Sender: nathansamson@gmail.com
Received: by 10.52.38.104 with HTTP; Thu, 9 Feb 2012 12:52:53 -0800 (PST)
From: Nathan Samson <nathan.samson@student.ua.ac.be>
Date: Thu, 9 Feb 2012 21:52:53 +0100
X-Google-Sender-Auth: 4Ih9wSOrN1FYYMnqF36LT0PHZEo
Message-ID: <CAPw5SVERSLNnu8Fm6SOn3sYraytVmrR5iGYdOJ8NyQ=MQvreZw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: First time user: suggestions
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
X-List-Received-Date: Thu, 09 Feb 2012 21:01:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I've talked to someone on FOSDEM about OE, and wanted to try it (I also
just started to use OpenWrt for a university project)

These are my first time user notes (and suggestion for improvements).

Starting with: http://www.openembedded.org/wiki/Main_Page and especially
the "Getting Started" Page. This seems to be outdated (using the classic
repos and not the "layered" core. Building the classic branch did not work
out for me. Not a very good first user experience. I suggest that the the
Getting Started page is replaced with the contents from
wiki.yoctoproject.org/wiki/OpenEmbedded-Core (and slighly enhanced).

Building the -core was also problematic. Two packages caused troubles:
zlib and another package (don't know the name anymore). Both problems were
caused because it could not download some files.

It seems zlib.org removed all downloads prior to 1.2.6, and OE uses 1.2.5.
Applying the patch from http://patches.openembedded.org/patch/20641/ fixed
the problem.
The other package could not be downloaded because it was hosted on
kernel.org and the content seemed to have been removed.
http://permalink.gmane.org/gmane.comp.handhelds.openembedded.core/14810helped
me fix the issue.

Suggestion 2: These download problems seems not be fixed very rapidly
(although they should be quite easy to fix). I wonder why. My theory (but
prove me wrong), is that developers won't see this because they have the
download cached in their download directory So only new users will discover
this.
One solution could be to have a dedicated "test" machine that tries to
download every package every day (or at least see if it still exists). Once
a failure happens it is reported to a log/bug system.

In the case of zlib: if they remove the previous version every time when
releasing a new one it should be better to mirror the files on your own
hosts, otherwise every time zlib does a release OE won't work for some time.


Suggestion 3: Create a site like "
https://community.dev.fedoraproject.org/packages/" where one can search for
packages / recipes. This site should integrate with
 * Recipe info (name, maintainer, layer, version info, changelog info, ...)
 * Bugs
 * Incomping Patches / reviews
 * Build results

For build results: (which is suggestion 4):
Create dedicated server machines that test each and every package every
time it is updated (built without any other packages except for its
dependencies, with several toolchain configurations - combinations of
target / libc implemenation / gcc version / ...). In the optimal case every
package should be tested with every possible combination of enabled
features but that is probably not possible. This way errors will be quickly
detected.
I already have to apologize: it seems that these already exists (somewhat),
in the form of tinderbox.openembedded.net and garnet.openembedded.org
(I've found about them when looking on the Infrastructure Wiki page), but
they don't load here... (Are they still maintained / what are they doing
exactly?)


Greetings,
Nathan Samson

