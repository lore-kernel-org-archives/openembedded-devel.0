Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1O9O7W-0001Zn-I8
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 21:49:33 +0200
Received: by vws14 with SMTP id 14so16719vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 12:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=ng46FuCIzAZbH17Ut5wDtBhWdKhD+Dphs4tBtmk0+Dk=;
	b=om4KiqHVqSEiN8bzTR+/zTQgTz2r3nQx2zoLhsHyu04U2LK+B6ccaI+tV6hpnDXuY7
	QPWgrNMhhLIcnj1P1SgMUaPUZ2wF34esmFTeNIVxFOH7Ytrxd/pY684x+lHOGzURQ3jO
	FqgqXgFtmVVqCKu9P2TjiMNkhxoKoCvBPy4J0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=xcNTtwiWvFXgxgIhf+xrE/7ttYzPUJ3bPzyWbPxvXh+tKGEsK9tGrXCVu3BViqnLmg
	/mzjhSdmWiTbM8D7zjMUYoQG0XVOtvlAImrwwPN2EFug7uWVtGEztGiMmAIvXiCfqf8T
	zCCt6v1mYNSx+RhOGXLUmxe8KdrrSB+ZvDOX4=
MIME-Version: 1.0
Received: by 10.229.181.138 with SMTP id by10mr3584059qcb.9.1273002342932; 
	Tue, 04 May 2010 12:45:42 -0700 (PDT)
Received: by 10.229.78.225 with HTTP; Tue, 4 May 2010 12:45:42 -0700 (PDT)
Date: Tue, 4 May 2010 14:45:42 -0500
Message-ID: <z2od1ded4381005041245j8e67e6e9z8790de994abb4e2c@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: GSoC participation
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
X-List-Received-Date: Tue, 04 May 2010 19:49:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

Via the Linux Foundation and Grant L. mentoring help, I will be working on
OE to
improve xilinx platforms support and adding Microblaze arch support;

Our Gsoc work aims tree areas
1. Support most xilinx target platforms
2. Add microblaze arch support
3. Improve software/hardware co-design work flow

Over the lasts moths I've been working on xilinx ml507 board support
to the point that been able to run xfce46 in this platform, some patches
are still queued in oe mailing list,  and we want to extend this
improvements
to other xilinx boards. Some descriptions of my work can be found at my blog
[1].

I already start with microblaze support [2], an encounter that I will
be fighting
with autotools hell this summer :); Running `bitbake task-base` it reachs
the point
to start cross-compiling and it fails due that config scripts don't have
target
definitions for microblaze, see error log at [3];forgive my autotools lack
of expertise
but where do I need to look to add target information for microblaze.

Thanks in advance for your help.

[1] http://aalonso.wordpress.com
[2] http://www.gitorious.org/oe-microblaze
[3] http://pastebin.com/DpZFsCgb

-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

