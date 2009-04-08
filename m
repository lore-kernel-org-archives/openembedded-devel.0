Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LrbH6-00088N-Uv
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 19:09:23 +0200
Received: by an-out-0708.google.com with SMTP id b2so328791ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=RPPnoa/QsCWIkiZdOXP5akTcTy1XCy0OUnYm1/m0wE0=;
	b=acgZq8UEHNfEiQx0lhT139ueNPX3sAlR8gFfR7Sv3plT2Of+Fxakbhsc0N3Qto1m4Z
	7fdIbRiq21i70deVTj4WFDiblFkBHMm2zT/QoHUmHB7TolXtsqF/cj/WuC/DOLZ85dx2
	o4DlaTiTJ/CZi8JPlQHQK7AkMGsdZ+EAVTPgk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=oMFLZQX2pM0Jt9s7FbMCr0bdJtVAw5+0GveyrlW6PHyuvsYahZ7J6TWhnSC80UVl4C
	8CllrODhD/M3CCISm1ZvoGzzzz2N0ZD8ZIqQDM8O7iGGwtHUCXP35UdL5WV1TON/0WS/
	XeTXL6CzrUP0eXf4DJdfbophML/dr64RMKN+o=
Received: by 10.100.167.3 with SMTP id p3mr3333521ane.141.1239210376378;
	Wed, 08 Apr 2009 10:06:16 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id c1sm604336ana.20.2009.04.08.10.06.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 08 Apr 2009 10:06:10 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 68D96C48D6E; Wed,  8 Apr 2009 14:06:33 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <20090402185006.GA12552@denix.org>
	<20090402191118.GC30840@smtp.west.cox.net>
	<20090402203832.GC12552@denix.org> <20090407162432.GA11203@denix.org>
	<20090407213412.GF11203@denix.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Wed, 08 Apr 2009 14:06:33 -0300
In-Reply-To: <20090407213412.GF11203@denix.org> (Denys Dmytriyenko's message
	of "Tue, 07 Apr 2009 17:34:12 -0400")
Message-ID: <87tz4z13dy.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.132.247
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: package_ipk.bbclass fails due to a wrong version of a	package
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
X-List-Received-Date: Wed, 08 Apr 2009 17:09:23 -0000
Content-Type: text/plain; charset=us-ascii

Denys Dmytriyenko <denis@denix.org> writes:


[...]

> Ok, the problem comes from the 1af5030de05a1e65d1de734f7675ffc22c8318fc 
> commit taken from Poky, which seems legitimate, as it "fixes" the generation 
> of pkgdata/runtime files by adding extra fields, such as PN, PV and PR. It was 
> commited as part of RPM packaging.

[...]

> The above commit from Poky may unmask some other similar issues, not related 
> to curl - for example the one Otavio reported recently. It can be easily 
> verified if it is the rootcause:
>
> $ git revert -n 1af5030de05a1e65d1de734f7675ffc22c8318fc

[...]

I can confirm that it solves my issues here too; please revert it in dev
and stable.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


