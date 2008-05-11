Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JvKKh-0000Wc-27
	for openembedded-devel@openembedded.org; Mon, 12 May 2008 00:47:55 +0200
Received: by an-out-0708.google.com with SMTP id b21so449897ana.6
	for <openembedded-devel@openembedded.org>;
	Sun, 11 May 2008 15:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=7X2T1WGHfZI2S2fCL1pX++/gdxsh1VUHDBm9el2+ELQ=;
	b=eYfSsBgQQw1AIz/sDzvE5Kp8VrM7Jl4Wazm2/ZVKVnbL5+inBWH+CtDXxH6xPmlkipJtEInhuSazMonUfHY3X7gmYjhp8rpK2eshg1+wstjuRyvCio8AAvol/XaHzDubULTxuDS+C2abUiTDqIfcCjPBO1RbkFROHGb21XCtCNQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=vIHo+zqzDBz0Rb4VjEuF7YuY9W25gUq5MXQXPlHpvrX7zDry3b5afQdePFwGXmNEgvM1x+ZI0ctpxMGhaKD0n2NFq6yAngdkgMrmggZ3BP8yOO1l/3eAHUJcRrNS/cE0cNPD7xlrtfMjxF5PXjJGHIl4w5FUsXIjJ7O8qCBc/ZQ=
Received: by 10.100.8.10 with SMTP id 10mr7676895anh.54.1210546004556;
	Sun, 11 May 2008 15:46:44 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Sun, 11 May 2008 15:46:44 -0700 (PDT)
Message-ID: <c384c5ea0805111546g62514fd0r484f57471997c958@mail.gmail.com>
Date: Mon, 12 May 2008 00:46:44 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g04ftr$krb$1@ger.gmane.org>
MIME-Version: 1.0
References: <g049dg$2ks$1@ger.gmane.org>
	<c384c5ea0805100820t64c75e41qde797bfb3245b7ed@mail.gmail.com>
	<g04ftr$krb$1@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Sun, 11 May 2008 22:47:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Koen,

On Sat, May 10, 2008 at 5:44 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Leon Woestenberg wrote:
> > Maintaining recipes that are _cvs or _svn are not feature freeze.
> > Stable does not match with the SCM versions and should not be chosen
> > in any stable distro.
>
>  I have trouble parsing that statement. Are you saying "do not use _<scm>
> recipes in a stable distro" or something else?
>

Yes, do not use _<scm> recipes in stable stuff, a known checkout of
the OE stable branch should either build or not for a particular
machine/distro/... combo.

If I checkout today's stable tree in one year time, it should build. Period.

That isn't going to work with _<scm> recipes being active in stable.

(and sorry for the badly formed statement - I don't take enough time
to write down what I would like to say - maybe I should just shut up).

Leon.





-- 
Leon


