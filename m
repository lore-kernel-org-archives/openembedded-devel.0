Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <acassis@gmail.com>) id 1MGyBw-0007M6-DG
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 18:40:53 +0200
Received: by gxk2 with SMTP id 2so588759gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 09:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WnDU4XbMGzHARaNGEeEcl+4YLhhMGA93OJ2pwrXqpeM=;
	b=MbCrNsuEmZ+aCrlRs47b03hph7w+4azb25liBasCGS9KyPyPjlhSr1I6qGrWyCG9+M
	201biaFwB3PB0bFEQfmP4paVkWTq+M3otvQuDoa7rxWBhUYS/TPrYureHQDw0DG5HpXz
	j+QZHFFBk/PWyTNEtnanIhgRXAJ0NTW81Q/94=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FDJaq273FcZ8sdpXFQshin2GXNcMC5IHUvA3t4dnTkthRRakztuVRSehUpugzz1Cg5
	gN3U8xEvB9UqQfO2UPAww1xbbpqac+XLxoFW68fpUWSlfdR7hV/plRm1gNB3Dz3qXqxG
	PBoJm/2EPVdXSA6pPGJnausjoSGuq1rHQkJyo=
MIME-Version: 1.0
Received: by 10.151.7.10 with SMTP id k10mr1499595ybi.260.1245256222933; Wed, 
	17 Jun 2009 09:30:22 -0700 (PDT)
In-Reply-To: <20090617003646.GA15477@smtp.west.cox.net>
References: <37367b3a0906161523p3bca0c45k69f0415fa5796e85@mail.gmail.com>
	<20090617003646.GA15477@smtp.west.cox.net>
Date: Wed, 17 Jun 2009 13:30:22 -0300
Message-ID: <37367b3a0906170930y16e1659ei4d9cf4aea667920a@mail.gmail.com>
From: Alan Carvalho de Assis <acassis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Add basic support for i.MX27ADS board
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
X-List-Received-Date: Wed, 17 Jun 2009 16:40:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 6/16/09, Tom Rini <trini@embeddedalley.com> wrote:
>
> Since this is using mainline kernel, you should start a linux_2.6.30.bb
> (based on 2.6.29) and add DEFAULT_PREFERENCE_mx27ads = "1" to that,
> rather than adding a new kernel recipe.  The machine.conf looks fine
> otherwise, however.
>

Thank you!

I will to adapt it and submit again.

Alan


