Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Greylist: delayed 796 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Sep 2014 16:15:28 UTC
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id F3EAB65CA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 16:15:28 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s8BG28v9026929
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 18:02:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1410451331;
	bh=lSK+un7DiY/HzDtkfOq1PgpaNUoM8z4xbmdnGMH6fbg=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=jnOnhsVpjSZKfxjqIksN0txS1mmjS6KaLbnnNKiv++oDL7+bdgc66nNlY599HdSX0
	33yzdw7Gf+ta5ik0/YXeY99cXVzaRYZ69LcalKjUXmlHRPit6KlaGEXx2qUcrt8fdv
	cdQkqqi5b2Fhev5d9W12C6mAUlZYhYLC0GWQDyV0=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s8BG21gQ001746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 18:02:03 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XS6or-0004Sh-4a
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Sep 2014 18:02:01 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <cover.1410279874.git.liezhi.yang@windriver.com>
	<63e89adc5ffc2c1e30a4b2a41ca0988e95158554.1410279874.git.liezhi.yang@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 11 Sep 2014 18:02:01 +0200
In-Reply-To: <63e89adc5ffc2c1e30a4b2a41ca0988e95158554.1410279874.git.liezhi.yang@windriver.com>
	(Robert Yang's message of "Tue, 9 Sep 2014 09:27:46 -0700")
Message-ID: <lyha0ei1s6.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.2
X-Spam-Level: ------
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [PATCH 02/14] autofs: add bash to RDEPENDS_autofs
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
X-List-Received-Date: Thu, 11 Sep 2014 16:15:38 -0000
Content-Type: text/plain

Robert Yang <liezhi.yang@windriver.com> writes:

> possible bashism in autofs/etc/init.d/autofs line 116 ($"foo" should be eval_gettext "foo"):
>
> +RDEPENDS_${PN} += "bash"

Is this bashism only in the initscript, or somewhere else too?  If it is
only in the initscript, the RDEPENDS should be a RRECOMMENDS because
package seems to contain also a systemd service.


Enrico

