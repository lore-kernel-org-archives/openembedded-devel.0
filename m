Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JvY2w-0007df-9w
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 May 2008 15:26:30 +0200
Received: by an-out-0708.google.com with SMTP id b38so470163ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2008 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=BwKeyIlgNcuZsluRSnupywww3/9WtWzjxDWgmJmb1bM=;
	b=L0DnTeWSLZWn/pMMBuoglFKnptJPxBf/DaXRK9ZiC1dW6zyv8pH6935VTwm+p3xh2PJE51WOZc2xidkELH/1lkxCpGx+h0XU4y/h4aUdDForYAzLYCZtcX3FOVIkpVFpjlXk5Nbn1f29p+JMnPO+EU2PpyiN8YLbq4gg08WDCoU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=Ae8ASgGlJcBcCs8LplWv4lUEh+V06QEokdMaempIH7sOsLYd7peNiPINRiYCKtFcf0m6eCBvgzJJT0WYJpqPBbPpI5kUD2afFfQbe7Q8AyqesEgZpZVod7SVVacZgYtd0d0phy5NippyVu3Bx+hQdz8XYbIyfjzlwtX9zPN5n+A=
Received: by 10.100.91.17 with SMTP id o17mr8098391anb.90.1210598714470;
	Mon, 12 May 2008 06:25:14 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 12 May 2008 06:25:14 -0700 (PDT)
Message-ID: <c384c5ea0805120625m4176d6eay57e08304d6e76923@mail.gmail.com>
Date: Mon, 12 May 2008 15:25:14 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1210576761.4981.1.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <g049dg$2ks$1@ger.gmane.org>
	<c384c5ea0805100820t64c75e41qde797bfb3245b7ed@mail.gmail.com>
	<g04ftr$krb$1@ger.gmane.org>
	<c384c5ea0805111546g62514fd0r484f57471997c958@mail.gmail.com>
	<1210576761.4981.1.camel@dax.rpnet.com>
Subject: Re: RFC: reverse the name change for org.oe.stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 12 May 2008 13:26:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Mon, May 12, 2008 at 9:19 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Mon, 2008-05-12 at 00:46 +0200, Leon Woestenberg wrote:
>  > Yes, do not use _<scm> recipes in stable stuff, a known checkout of
>  > the OE stable branch should either build or not for a particular
>  > machine/distro/... combo.
>  >
>  > If I checkout today's stable tree in one year time, it should build. Period.
>  >
>  > That isn't going to work with _<scm> recipes being active in stable.
>
>  Floating SCM versions won't be reproducible, fixed SCM versions will. If
>  SCM versions are used they need to be locked to a version.
>

Agreed, so I would like to propose the stable branch should not need
to support floating SCM versions.

Only full lock-down (and tarball mirrors) will make our stable trees
useful in the long term.

It's an important property of a stable tree, that third parties using
them can rely on them to be able to perform a bug fix in say, one year
time.

That reminds me, we should lock-down (and include) the corresponding
bitbake version in the stable tree as well.

Regards,
-- 
Leon


