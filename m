Received: from [209.242.20.84] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1IWBgh-0006uM-T2
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2007 15:58:28 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 1B1DD4121DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2007 08:55:10 -0500 (CDT)
Message-ID: <015e01c7f6d6$d6f05f60$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <E1IVzbz-0007pX-Aa@linuxtogo.org><46EA2668.6080307@student.utwente.nl>
	<1902785051.20070914121859@vanille-media.de>
Date: Fri, 14 Sep 2007 08:54:58 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Re: [oe-commits] org.oe.dev libgsmd: add modified start scriptfor fic-gta01 due to problems w/ UART multiplexing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2007 13:58:28 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

> Koen Kooi wrote:
> > mickeyl commit schreef:
> >> libgsmd: add modified start script for fic-gta01 due to problems w/
UART multiplexing
> >> See http://bugzilla.openmoko.org/cgi-bin/bugzilla/show_bug.cgi?id=788
for more information
> >> This is hopefully just a temporary solution...
> >>
> >> Author: mickeyl@openembedded.org
> >> Branch: org.openembedded.dev
> >> Revision: 235d3c4d9fbc3aee4e352851f04eb4fa2da4a68f
> >> ViewMTN:
http://monotone.openembedded.org/revision/info/235d3c4d9fbc3aee4e352851f04eb4fa2da4a68f
> >> Files:
> >> 1
> >> packages/gsm/files/fic-gta01
> >> packages/gsm/files/fic-gta01/gsmd
>
> > Coudn't this be done in the existing startup script with and if [
machine = gta01 ] guard?
>
> We could, but...
>
> >  We did a lot of work in the past to make gsmd not machine specific,
this undoes that
>
> No, I'd like it to be a BIG FAT sign that there is something wrong
> here.

This is a temporary work-around.  A better solution is to reset the flow
control from within the kernel, in the same bit of code that powers-down the
GSM modem and re-enables the console -- and that code is already
GTA01-specific.

I'll work on a suitable kernel patch to replace this specific workaround -- 
wack me over the head if it doesn't get done in the next week.

Mike (mwester)



