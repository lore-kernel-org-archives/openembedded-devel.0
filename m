Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBQGE-0003F4-9h
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 15:12:14 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 05:59:42 -0700
Received: by obblz20 with SMTP id lz20so655432obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 05:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=W3WCtB71q8GbX1/VVABZapgbYVdfKOM+jW9ySCVSTfQ=;
	b=asT8fCaFIvb6Qcs9nRyWbIEqEWK2OqwuVIP1M20sH3fWoQ/NoV44PVnhZYhQid4VF4
	mNEuWHUPl1wLlApVEZit1YRcT01GaLNceZQ76e9SFBf0k48af9OJMe5it5r4qZokQwC5
	J4IF2HSjxoiFPins7AHtMNhZ+dEa+ekzawPfwSZVgX9hGuoIzkaVYHA00T8VfyYbnHGu
	udvR1uvKlXzbXMNhlhDu2oueejOAQnFZeOmVqLqxOrYEO42h72baKgdIV9LADh1ORUvl
	yYgCBDfGSm5OJrIEq85/+6kXM13iSU8wjj9ZAGjgpyZI/+ar7UU0RV5PAbLlB6BC9XKz
	7U8A==
Received: by 10.60.171.174 with SMTP id av14mr18325443oec.61.1347368381423;
	Tue, 11 Sep 2012 05:59:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 11 Sep 2012 05:59:21 -0700 (PDT)
In-Reply-To: <1347367374-10517-1-git-send-email-sledz@dresearch-fe.de>
References: <504D81F8.9020702@dresearch-fe.de>
	<1347367374-10517-1-git-send-email-sledz@dresearch-fe.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Sep 2012 13:59:21 +0100
Message-ID: <CAJTo0Lahx_1K64aBhag10RN=jSE+fz=APC9HnCwp-zxyb0-qgw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkJph3OiNrrmKUGS+jfKd6E5PISNytqR3tAQZwGQIuomyvU59kkX+aMxpXX0JWK1b9eSgUb
Subject: Re: [2011.03-maintenance][PATCH] gdk-pixbuf: add missing dependencies
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
X-List-Received-Date: Tue, 11 Sep 2012 13:12:14 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2012 13:42, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> | No package 'atk' found
> | No package 'pango' found
> | No package 'cairo' found

Those are spurious dependencies in a very old version of gdk-pixbuf.

oe-core master has 2.24.1 at the moment, is there a good reason why
meta-oe is hanging onto 2.10.14?

Ross


