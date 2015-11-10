Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9F53177160
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 07:34:26 +0000 (UTC)
Received: by wmww144 with SMTP id w144so63310791wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2015 23:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hSnLZvpjrcBrwXOossDM9AhpRFzSIRoievhdP+kQWb4=;
	b=irwHeRhfe88Uv43IkkGVFRs9FNAk+McevwXzx4uyuJC0di3dXTDsseyF8F22pKHXHz
	9tAAGkI9UmkK00Wpuz1dLC5fEV/rSOJMhLXiO65d9Ne3/jI8PLHkkuOksVJe/+aju4Pb
	M/vY6933PgoAfqNkrTPGtY5cAsx2nj0bPUmxCiQZlLob9IISkU9Z5b9T71WgE1nqQhKz
	NgXNFPIzKVd1VTnyMGRagEx1vbQY+if2twuoZL2yi31p0UOsmVxIBNpNdf1CKUO9Y0/4
	pxxikVW6ZpnbqGrsVj3JX7m9wz51XltsTZJH6UM02jlrzT0FN+7EU2XC2KryIXDfvKg6
	PEQA==
MIME-Version: 1.0
X-Received: by 10.194.142.142 with SMTP id rw14mr2234793wjb.100.1447140866504; 
	Mon, 09 Nov 2015 23:34:26 -0800 (PST)
Received: by 10.194.154.232 with HTTP; Mon, 9 Nov 2015 23:34:26 -0800 (PST)
In-Reply-To: <56410EB4.3010002@pseudoterminal.org>
References: <56410EB4.3010002@pseudoterminal.org>
Date: Tue, 10 Nov 2015 08:34:26 +0100
Message-ID: <CA+chaQeoAne_toNEniFzYWSOFphPa4xgK48t-_okijZndFVUJw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Why is GLib disabled?
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
X-List-Received-Date: Tue, 10 Nov 2015 07:34:27 -0000
Content-Type: text/plain; charset=UTF-8

Partially historic reasons no longer valid with _remove operator.

It's easier to add stuff to PACKAGECONFIG than remove stuff. So I wanted to
make meta-qt5 as small as possible (to build) with minimal PACKAGECONFIG,
there are couple of comments in qtbase_git.bb advising people to enable
some PACKAGECONFIG options to make qtbase more useful for other recipes
like qtdeclarative or qtwebkit.

Regards,

On Mon, Nov 9, 2015 at 10:23 PM, Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> Hello,
>
> in most Qt5 builds, I have seen GLib support enabled. But in meta-qt5, the
> corresponding packageconfig is disabled by default. Is there a reason for
> this?
> It does cause problems when interfacing with libraries that make use of
> the GLib mainloop (for example, GStreamer).
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

