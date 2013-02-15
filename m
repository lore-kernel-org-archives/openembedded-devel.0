Received: from mail-vb0-f44.google.com ([209.85.212.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U6Jln-0007wM-Cp
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 12:48:04 +0100
Received: by mail-vb0-f44.google.com with SMTP id fr13so2045683vbb.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 03:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=QgwLtSfeRihNubvSZpEo2jDW3oS+YAUhv6JBCt9r/x8=;
	b=oUPZdcMnY+F2K/jVCqTowq/ySZVPo6Pg/HCmIZ9dW5seh+UndMi3/+WX8+g1gg/k81
	3Lz5xswVove+ZgskbR56qo+KUnU50X+Y7slHvqC3SomSwPFV/6Tp0rRJbocGGa4sB5tH
	BkUqdouZEhKit2PmcR22tmp+UGcYrMBdQt+azzmBjkybxa7ZpfgVDwlMtgXxy6XZVJAJ
	Vb7OwqYbFuYIU2NiLdMt+Apz3jlHQgGD8n/owxSsqyfup0R9RFymi9eFxl9W4FUjhedS
	hd/HFXcdYOviu+PoQBcSEKVC+OmusCe4aW/nH/7T5zjpiTDnO5aEKKo9OE+SGVVKF+S2
	+Jzw==
X-Received: by 10.58.252.72 with SMTP id zq8mr2739742vec.20.1360927915374;
	Fri, 15 Feb 2013 03:31:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Fri, 15 Feb 2013 03:31:35 -0800 (PST)
In-Reply-To: <CAKSKmM2bC1C65ca2RZcKvz3yTEM_9+yHFq95yMD+hJPWpYziCA@mail.gmail.com>
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
	<CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
	<CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
	<CAKSKmM2NNdci6kCtaxnWDgApkFerkTDYFGy78-XddG9N8xqBGw@mail.gmail.com>
	<CAJTo0LaESjBTOXzxQzQm5KxkQqOi8HnKgJxxjr99mNWTbbeVog@mail.gmail.com>
	<CAKSKmM2bC1C65ca2RZcKvz3yTEM_9+yHFq95yMD+hJPWpYziCA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Feb 2013 11:31:35 +0000
Message-ID: <CAJTo0LayOQb60HB--SWiWBYau=ECryZx7Kn_QD21-G8kEMZiog@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnxYb4+mfxwikKb9ZJJSKJtEJwbT2TaenGaBQfBx7krXXsgsnb5f7T6CZ+PkjW7KZT8zG8D
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Fri, 15 Feb 2013 11:48:09 -0000
Content-Type: text/plain; charset=UTF-8

On 15 February 2013 10:50, Sankar H Malarmani <sankar.m@hardcube.in> wrote:
> /home/hc/oe-core/build/../stuff/openembedded-core/meta/recipes-connectivity/wpa-supplicant/
> wpa-supplicant_2.0.bb inherits systemd but doesn't set SYSTEMD_PACKAGES

That error message describes the problem quite well.  You appear to be
mixing very recent oe-core with an older meta-systemd, which won't
work as they are both undergoing heavy systemd changes at the moment.
If you update both at the same time you might get something that
works.

Welcome to the joy of building against git master of multiple
repositories - things break.  Unless you're capable of fixing the
problems as you find them it's recommended to use the stable releases
instead of git master.

Ross


