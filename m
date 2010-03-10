Received: from web88207.mail.re2.yahoo.com ([206.190.37.222])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <jkortje750@rogers.com>) id 1NpVll-0000lq-0v
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 00:56:54 +0100
Received: (qmail 90432 invoked by uid 60001); 10 Mar 2010 23:53:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rogers.com; s=s1024;
	t=1268265234; bh=oJmFEP+ARtCQZYm5YB8t5uwHNvtADM1df54s0OKfQQM=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=tY5gNO8mH2kH5dQ1TvvEz+S5w7Crtt94njRYX5Ri/VHyanWGAE3B+Iz7AsREHbn6GundCeQJGlIcVoIsw6fHO3rD2/YdAzKqHjEPT3Fgm8wPAep5CVTcCYvL6v0umjUg+QRQmaQrAAeVEh7xBY6eskg3bnxClcv2zDm5tmkxhxo=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=rogers.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=baT5JlzsQHK4Uh/v/WMK1Ny13RPWzSsyd9/jmVuwB1wj94RCT10UaKGKVSkI59NpN6TYZXgeKeCEFwhNrEPCqXYBktmsHJuU9UQC543LzTZLQPKeoIypc7cnnvYkIHxJupGdOB6dlNAVtZOkyiGGnFPp5lnb/DELCZOVS81T490=;
Message-ID: <738913.90211.qm@web88207.mail.re2.yahoo.com>
X-YMail-OSG: jscrziMVM1nBZ_WYStlo.Ryui.bhB5hS5CyZbt1u3LHrR_o6ZyzGaDksfbu3yEOL3mhVvYPys.Od9X4wmt3.3Gz2xRNSR8oNxQDzMQJB_mAhncqNFpg0GlubflMaO47b3LtlcTDsRmxlhGq.ILxYiPOo00KrW32ZJbm4FAgyvoiUEJExJp91MMFgzrH.iQqBYsabllhf51cGhyU_Ja3B2RDLTbg36mhmP_IR8qE5hqxNbwPMywIoDGAAbnYVzsvPbOXZxboTvKR9r4mZgcHcTiGlKbkx723laapzndUy6ZMKce9pLrYjqhlb1ZX5PC7s7z8qoEuTR17v25oBYa90Ng--
Received: from [99.237.255.32] by web88207.mail.re2.yahoo.com via HTTP;
	Wed, 10 Mar 2010 15:53:54 PST
X-Mailer: YahooMailRC/300.3 YahooMailWebService/0.8.100.260964
Date: Wed, 10 Mar 2010 15:53:54 -0800 (PST)
From: JOSEPH KORTJE <jkortje750@rogers.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 206.190.37.222
X-SA-Exim-Mail-From: jkortje750@rogers.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-commits] Phil Blundell : gtk+: build gtk-demo and package it appropriately
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
X-List-Received-Date: Wed, 10 Mar 2010 23:56:54 -0000
Content-Type: text/plain; charset=us-ascii

Hi Phil and Steve:

If we *either* install 

sudo apt-get install libgtk2.0-dev

or if we do

bitbake gdk-pixbuf-csource-native

FIRST 


Then the

    bitbake gtk+

succeeds.

Otherwise, with the same tree used by Steve, same results as Steve mentions.

Any ideas why?
From douglas.royds@tait.co.nz Thu Mar 11 04:05:36 2010
Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1NpYiJ-0002EY-Gh
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 04:05:36 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 923C246753
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 15:34:09 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id 808BB46751
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 15:34:09 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0KZ300B01FKSES00@sunstrike.tait.co.nz>
	(original mail from douglas.royds@tait.co.nz)
	for openembedded-devel@lists.openembedded.org; Thu,
	11 Mar 2010 15:33:51 +1300 (NZDT)
Received: from [172.25.116.17] by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	with ESMTP id <0KZ300BF0J4BRM10@sunstrike.tait.co.nz> for
	openembedded-devel@lists.openembedded.org; Thu,
	11 Mar 2010 15:33:49 +1300 (NZDT)
Date: Thu, 11 Mar 2010 15:33:47 +1300
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <BAY127-W3F00BA8EB939E019488D8D8330@phx.gbl>
To: openembedded-devel@lists.openembedded.org
Message-id: <4B98568B.2030603@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
References: <BAY127-W3F00BA8EB939E019488D8D8330@phx.gbl>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
X-SA-Exim-Connect-IP: 202.37.96.11
X-SA-Exim-Mail-From: douglas.royds@tait.co.nz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe] Problem with  Boost library
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
X-List-Received-Date: Thu, 11 Mar 2010 03:05:36 -0000

The recipe is broken.

Edit recipes/boost/boost_1.34.1.bb, and replace the line ...

    PR = "${INC_PR}.1"

with

    PR = "r4"

The INC_PR convention is used for recipes that have include files. This 
one doesn't.

HTH,
Douglas.


saleh usman wrote:
> [snip]
> NOTE: Running task 1353 of 3317 (ID: 1614, /oe/openembedded/recipes/boost/boost_1.34.1.bb, do_setscene)
> ERROR: function staging_helper failed
> ERROR: log data follows (/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/boost-1.34.1-${INC_PR}.1/temp/log.staging_helper.21242)
> | sh: /oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/boost-1.34.1-.1/temp/run.staging_helper.21242: No such file or directory
> NOTE: Task failed: /oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/boost-1.34.1-${INC_PR}.1/temp/log.staging_helper.21242
>   



=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================



