Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Oc2jw-0003Vj-N1
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 22:51:46 +0200
Received: by gwb15 with SMTP id 15so385550gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 13:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=AjIHu6LyOpDBWnKAmvjZX1SBhycOcuequRjO51fqbac=;
	b=Pvti6x/SRlKtrZj1BB5lDpgrsS5raKbeuqeOUESCaBczCTRG5qkxDo+1K/L+gqNLjP
	PKjlOa4zEK6wLvkHp/cU/KPvSoU+bzKDtXd4waJoA7x2WIhCz47U2jG655ku04laSD6y
	Bh5WtsZA5kKBwy9cb+XQ8Twi2A2eKMR63DNBA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=P5Yjj8zrZqwpj1HqAxEFbWxt0D7zBepycly9VGanm6CJvAj3KoxmPgRb1xb1CAoFUE
	JZxL+rVrmwOBGERok9gLl5jI4UU5Mw25m98LdxCJ35mW5S4SO5hRgZmD9gs7KTJ39gmi
	9sLa4LdTjsgRZK8EyAXQsBx6B1vz1w2JDqBoI=
MIME-Version: 1.0
Received: by 10.101.177.9 with SMTP id e9mr2826684anp.195.1279831878774; Thu, 
	22 Jul 2010 13:51:18 -0700 (PDT)
Received: by 10.100.42.4 with HTTP; Thu, 22 Jul 2010 13:51:18 -0700 (PDT)
In-Reply-To: <AANLkTinwgeYKdpLSQs7pSftxdCcUeGBppIfYj5ChLnIV@mail.gmail.com>
References: <AANLkTinwgeYKdpLSQs7pSftxdCcUeGBppIfYj5ChLnIV@mail.gmail.com>
Date: Thu, 22 Jul 2010 13:51:18 -0700
Message-ID: <AANLkTiloVWHCW6WtERRzrr_yKVCTweraq8_9bjPB1wv3@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc/gettext isssue ?
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
X-List-Received-Date: Thu, 22 Jul 2010 20:51:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

I notice that for a bunch of recipes that build in my image. and its
always a gettext error like that but it doesnt stop the build



On Thu, Jul 22, 2010 at 1:41 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> When building gcc I get:
> NOTE: Gettext required but not in DEPENDS for file
> /home/frans/oe/tmp_angstrom/work/nios2-linux/gcc-cross-4.1.2-r23.1/gcc-4.1.2/intl/
> configure.ac.
> Missing inherit gettext?
>
> but gcc-common.inc (which is included indirectly from every gcc recipe)
> says:
> gcc-common.inc:inherit autotools gettext
>
> What is wrong here?
> How can I resolve this?
>
> Frans
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


