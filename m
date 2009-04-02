Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LpTYy-0005s3-OK
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 22:31:03 +0200
Received: by qyk30 with SMTP id 30so1457419qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2009 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=XJgTI4ZudUvTJdPdBEA3W0LqQR7gGCHr8PxjLZAcuyg=;
	b=dy0zPn+dFbjAu7+oDyENB/HFfhmoVlLL80WQy7IiWiK812iZCmKGacC5hTcpd/Jan1
	BPdWP/ex0M3NQpC12RrrYVNPfy+MsaOLiz+qMK3cUeAeoGptuDxRt6hwZr0BUUk+SdSJ
	MwuH4zgrmwzIdpCQFSdvEPKRETMl+HHdQf+A8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=fXcFhnhp+LiNcI0cykWXlLrXyX3KtGzMGqhFoEBySp8wXiclf5emL4qr7gQ2x16g5e
	rRa+/m/YssRK0vrahkeUBz266Lmp/hziyZUiTOcjKYo8tLQsGbBNC5zehv3Un3IMgyJH
	W0Kb93/HLcu07Lljsf6jtT2wuJhCWVD00XnG0=
Received: by 10.224.15.14 with SMTP id i14mr800238qaa.12.1238704111651;
	Thu, 02 Apr 2009 13:28:31 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 8sm1840544ywg.14.2009.04.02.13.28.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 02 Apr 2009 13:28:30 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 83D506101AF; Thu,  2 Apr 2009 17:28:41 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <12386320381719-git-send-email-clarson@mvista.com>
	<49D48E6C.7070304@xora.org.uk> <20090402195608.GB12552@denix.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Thu, 02 Apr 2009 17:28:41 -0300
In-Reply-To: <20090402195608.GB12552@denix.org> (Denys Dmytriyenko's message
	of "Thu, 02 Apr 2009 15:56:08 -0400")
Message-ID: <87iqlm4x6u.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.221.124
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] bitbake.conf, collections.inc: Add	COLLECTIONS mechanism w/ a sane default.
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
X-List-Received-Date: Thu, 02 Apr 2009 20:31:03 -0000
Content-Type: text/plain; charset=us-ascii

Denys Dmytriyenko <denis@denix.org> writes:

> On Thu, Apr 02, 2009 at 11:07:40AM +0100, Graeme Gregory wrote:
>> Chris Larson wrote:
>> > Added code which takes a list of directories in COLLECTIONS, in priority
>> > order (highest to lowest), and uses those to populate BBFILES,
>> > BBFILE_COLLECTIONS, BBFILE_PATTERN_*, and BBFILE_PRIORITY_*.
>> >
>> > The default COLLECTIONS is based on BBPATH, so you can now specify a sane
>> > BBPATH, not bother setting up the collections variables or BBFILES, and
>> > still likely be able to do a build.
>> >
>> >   
>> I haven't had time to test the patch, but I really like the idea of
>> this. Also the archives part as well. This will make setup so much
>> easier for people wanting to overlay. And improve the ability for OE to
>> be shipped in setup scripts.
>
> +1 - support the idea!
>
> I'll try to test the patches on my overlay...

+1

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


