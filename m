Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OlsuH-0003Hg-Am
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 02:22:58 +0200
Received: by iwn38 with SMTP id 38so1157059iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 17:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Ki14br3b+kkqNAP+TgON7mXDPF/pBEWueUYRawkDv8U=;
	b=Tepye+dooy+AgWrcYFOl9aycfbeyWq+Fn+BAsPEiLEeHKi+O0G+WQpGYZW+w3UEA4n
	+jfBAdOtEA4PT0/fX9w+kilSj7bh+IOmNPxuLgojWr+rkHV5BB8fsyZFCOOjiA8CzvxR
	zLlN+xC4xo1kfVlyuvWxtQuxurZKwOvu2RHaQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AXfrQV79/ofnbuQZj7WyRaCE1KrDthWdyJXm7YIPWPticbFmKGht4VVMZ3t2fQNxy3
	HtTrWxGvxUuXXRl/QfJQv+UBbljSD20YzVVPiGh8XXFvgNx4T4jJPYreBiUG1/Zrtcx8
	8E4Qz6meC5deM43nKMyyKnmCbock5KfqlyB98=
MIME-Version: 1.0
Received: by 10.231.35.202 with SMTP id q10mr7684450ibd.138.1282177355086;
	Wed, 18 Aug 2010 17:22:35 -0700 (PDT)
Received: by 10.231.145.77 with HTTP; Wed, 18 Aug 2010 17:22:35 -0700 (PDT)
In-Reply-To: <D0882A66-CB99-4D7F-8DDC-3E1600C90DCF@chumby.com>
References: <811234B8-DFDF-42A4-9064-757210CE3CE5@chumby.com>
	<AANLkTinni2gtb_fb=Z_xp8ju3OhPtYf_dtAuzbXpOpxM@mail.gmail.com>
	<D0882A66-CB99-4D7F-8DDC-3E1600C90DCF@chumby.com>
Date: Thu, 19 Aug 2010 09:52:35 +0930
Message-ID: <AANLkTi=+G_vEmX4eF_tE13f=u5a=6yvwZ9zNYz_+5fwB@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] Add falconwing machine config
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
X-List-Received-Date: Thu, 19 Aug 2010 00:22:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 19 August 2010 09:33, Sean Cross <sean@chumby.com> wrote:
>
> On Aug 18, 2010, at 4:15 PM, Graham Gower wrote:
>
>> On 19 August 2010 08:33, Sean Cross <sean@chumby.com> wrote:
>>>
>>> Signed-off-by: Sean Cross <sean@chumby.com>
>>> ---
>>> =A0conf/machine/chumby-falconwing.conf | =A0 24 +++++++++++++++++++++++=
+
>>> =A01 files changed, 24 insertions(+), 0 deletions(-)
>>> =A0create mode 100644 conf/machine/chumby-falconwing.conf
>>> diff --git a/conf/machine/chumby-falconwing.conf b/conf/machine/chumby-=
falconwin
>>> g.conf
>>> new file mode 100644
>>> index 0000000..ed48cdb
>>> --- /dev/null
>>> +++ b/conf/machine/chumby-falconwing.conf
>>> @@ -0,0 +1,24 @@
>>> +#@TYPE: Machine
>>> +#@Name: chumby Falconwing machine config.+#@DESCRIPTION: Machine confi=
guration for chumby Falconwing-based boards, such a
>>
>> You seem to have a missing newline in this part of the patch...
>
> You're correct. =A0Terminal.app sometimes eats newlines when doing copy+p=
aste, and I missed that. =A0Here's the machine config again.
>
> The description is longer than 80 characters. =A0I see several machines t=
hat also have descriptions longer than 80 characters. =A0Is that acceptable=
? =A0If not, what is the preferred mechanism of breaking up data such as th=
at?
>

Ordinarily, I'd say use a backslash. But that would depend on what is
parsing the #@DESCRIPTION field (is this parsed by some documentation
generating script somewhere?). The only example of using a backslash
is in xilinx-ml410.conf.

-Graham


