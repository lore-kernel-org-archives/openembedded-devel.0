Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OmAZJ-0007g4-5f
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 21:14:29 +0200
Received: by yws5 with SMTP id 5so949249yws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 12:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8KgZ1lqA2BbxJ/QIZHngp68orruKEc5WmVBo7mtg18g=;
	b=qehAI/Vgjm4vaG8P+1MyzFRvQwhIvAB/cgJvPw1SC0Hbl07yBYJrGmjUnjCnP4zJkQ
	bwMoxbfQ4akLweUVO4s+ePTgmmLIwtUZ5SQ9Uf+9KOslI3jKIl6Z8CDapV4bjdzmiUNR
	KTooFx7FW9oWQ1vbDbnrpXlAyj6jWU/pPr+dE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sUsgZN30zozi1AHAvyVWHtOEarbRCSgzMHsntgcaR74gbgh3HG/tOWiPRoCZSvPyQZ
	mHMseG22+bsiz9c6b9uJWBs3Hx+rYTCpA+2xSDuueGj3Zt0V+S0NGwE+4Hr5Ejj8OAG4
	t20/YXMO8hqO+RFT3+TfJQZbuz/Ay1OP6IwP4=
MIME-Version: 1.0
Received: by 10.90.120.12 with SMTP id s12mr387926agc.198.1282245246912; Thu,
	19 Aug 2010 12:14:06 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Thu, 19 Aug 2010 12:14:06 -0700 (PDT)
In-Reply-To: <AANLkTinBzdnAYv_0O=vXnaJ5VNj56Th74eZ=naVSFcFB@mail.gmail.com>
References: <AANLkTimxWVes3DZQPGn53BZ1cL6BSX5BT3hwgFHrCUA4@mail.gmail.com>
	<AANLkTinBzdnAYv_0O=vXnaJ5VNj56Th74eZ=naVSFcFB@mail.gmail.com>
Date: Thu, 19 Aug 2010 21:14:06 +0200
Message-ID: <AANLkTikSBQOi6aC0W8QzfEOk6skMcBmbaJdmE4K+Auwd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: virtclass_install prepend
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
X-List-Received-Date: Thu, 19 Aug 2010 19:14:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/19 Chris Larson <clarson@kergoth.com>:
> On Thu, Aug 19, 2010 at 4:29 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
>> Hi,
>>
>> Found this in our reicpes:
>>
>> dbus/dbus-glib_0.86.bb:do_install_virtclass-native_prepend() {
>>
>
> This prepends to do_install_virtclass-native, which will then replace
> do_install when the overrides are applied. =A0This is prepending to a var=
iable
> which overrides, as opposed to the other, which is a conditional prepend.
> =A0The two are quite different. =A0It's unlikely that this is what they
> intended. =A0Far more likely that it should be changed to
> _prepend_virtclass-native.

I have no idea what is intended and I have no dbus knowledge, so can't fix =
this.
I'll leave it to someone else to resolve this.

Frans


