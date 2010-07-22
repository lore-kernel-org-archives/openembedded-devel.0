Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Oc4Fr-0002Kz-Ii
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 00:28:40 +0200
Received: by fxm12 with SMTP id 12so4736738fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 15:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3BiH9O9c7PHbZNI/nfPFocdKVaOP3EX+w5fbPRujip8=;
	b=se8N2Q6eqhxUEkwsV79YirrvYKBFznEk/IUSl1YUJB1B90Tv4mzMtrnRUBIK9EAZsA
	XnuqmCljEl1rPjtK7m1LOiFpafD3TZu8yxCKvv4KENKcDKZj4dbqb/s+JgIy0YFJNQtE
	d2D3TUSZOQRKAPXTLm/OkX+fZAyyOatwScr5c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IsNYel3RmRPt+u1y8TiW7NYBlpB9D3tFfeuCe4+00ylDmX29cd5GqZLz5alDwB2WNU
	AnxRRKYP0I2W31G5Y8F4sungkLbtdZdVxY2uQtCAntZ/48TxHlTbyF3CsJ+aGOm2Dj8n
	Kjuo+3IrrzKqQn6R4NPBGqgqW0WSWG9EGHnSw=
MIME-Version: 1.0
Received: by 10.103.225.3 with SMTP id c3mr808429mur.24.1279837707307; Thu, 22 
	Jul 2010 15:28:27 -0700 (PDT)
Received: by 10.102.59.17 with HTTP; Thu, 22 Jul 2010 15:28:27 -0700 (PDT)
In-Reply-To: <AANLkTinNRns3EDe0LUG767ZrQFc2OVS5IO_qKo4hT7Ue@mail.gmail.com>
References: <1279235731.6792.15.camel@utx.lan>
	<1279236014.6792.19.camel@utx.lan>
	<AANLkTinNRns3EDe0LUG767ZrQFc2OVS5IO_qKo4hT7Ue@mail.gmail.com>
Date: Fri, 23 Jul 2010 00:28:27 +0200
Message-ID: <AANLkTikE2fXfew1KVXgEWfv-V8LoVeH5sWKnVJY43BaF@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [Angstrom-devel] [PATCH 3/3] udev: fix multiple mounting of /dev, increment PR
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
X-List-Received-Date: Thu, 22 Jul 2010 22:28:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> =A0 udev: Fix possible multiple mounting of /dev, increment PR.

Tested on c7x0 with kernel 2.6.26.
Acked-by: Andrea Adami <andrea.adami@gmail.com>


