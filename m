Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by mail.openembedded.org (Postfix) with ESMTP id BE4A76C697
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 10:14:22 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id v23so4790565otk.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=t/W44rkkHUCI25eRQxjTNuYpmg9YR+FAYPRy8qZV5lg=;
	b=xeS6D2wbgO3625tWzGrEx/Jzmh9YZ3WRYvhcSVtngakPugYv1CE+SiP9LGNt4SxTHw
	dQ9XoKKyw7qs+1Z8zabS3AcTXOmHIahQ2EvV5eAV0qHRYoFbvwXVxeu1IR811M7Yl0yS
	450Rdw3DGxJaqAwJ9MX00cwSY7/8B4kPSG1FHHjqyQixA5GeZWSTOEtI9DIJ9Yz/TsfJ
	oTAlUPpyhzftBsO0CKsgRXn0jRg1cTqjUMAq2AcNuSw9ZilDvevzz7BTKDkEKQgX+x4g
	759XrsroGl8X4TLmWGXQaEpvFeb1XQhXDWB3ARd+ps/yLV2LhYaefLKRRVw4Lm1NXHno
	OTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=t/W44rkkHUCI25eRQxjTNuYpmg9YR+FAYPRy8qZV5lg=;
	b=Jsev+Qk2slpS4pg+ZWU9pUpNj15cwY3r9TK+yx22JD1RmQMbpde6b/5xijvWR+BM3U
	S6mrfO0lb7fBKsWSmGiBR7RNO4z4vc6CP56r7mVC+c8oXaqsTRYnYPIXn/jXQpAwCkSN
	FSKSlaffBgQmUl2tblfjBwKbSG4aSdy3RxHqnXvqznmdiP3HMGboJ0EMWzIAf5fvN7ih
	CKL9lzQnhShB0hEhuSgN9oisgUs0MydQ1mnUlBBfI+HVHTAcRMj+LWrLZFE6fImMwlsJ
	wF6ZHiOH/ESJQ9mrvvSf3IcQHu94sVpv+C7H+rIAmNbQW+DI37w8rUdmkdKf30EgHjG9
	sETg==
X-Gm-Message-State: AA+aEWY7wv+EM98RAju6EQfT7TfD22E1EIOUFW/sTRyoBxcDMhOeKjXR
	fQC8VzpHZntMvS4sR3nOzT0b29H0WknarQ==
X-Google-Smtp-Source: AFSGD/UwVcoWoHiCkJiFI5PisZFD+B6fRFrfi0wMPpbEFy+AflW/1HeXYDZrRmizhIWbN1acBvElnA==
X-Received: by 2002:a05:6830:1289:: with SMTP id
	z9mr5281105otp.281.1542968062836; 
	Fri, 23 Nov 2018 02:14:22 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
	[209.85.210.53]) by smtp.gmail.com with ESMTPSA id
	f34sm13360604otb.25.2018.11.23.02.14.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 02:14:22 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f53.google.com with SMTP id f18so8632007otl.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:14:21 -0800 (PST)
X-Received: by 2002:a9d:754f:: with SMTP id b15mr7982491otl.231.1542968061178; 
	Fri, 23 Nov 2018 02:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20181123093845.22336-1-otavio@ossystems.com.br>
	<7b2d9c6f-48d0-d3df-45c5-fe396b43576e@geanix.com>
In-Reply-To: <7b2d9c6f-48d0-d3df-45c5-fe396b43576e@geanix.com>
Date: Fri, 23 Nov 2018 08:14:05 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo9gYL-oV2o1HLmgeE8h46aXADs3F0yJPWZUZKGCb_VAw@mail.gmail.com>
Message-ID: <CAP9ODKo9gYL-oV2o1HLmgeE8h46aXADs3F0yJPWZUZKGCb_VAw@mail.gmail.com>
To: martin@geanix.com
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] postgresql: Allow successful run of postgresql-setup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2018 10:14:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2018 at 8:01 AM Martin Hundeb=C3=B8ll <martin@geanix.com> w=
rote:
> > diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/re=
cipes-dbs/postgresql/postgresql.inc
> > index 3bf71f02e..5fc823898 100644
> > --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
> > +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> > @@ -231,6 +231,7 @@ FILES_${PN} +=3D "${sysconfdir}/init.d/${BPN}-serve=
r \
> >          if 'pam' =3D=3D d.getVar('enable_pam') \
> >          else ''} \
> >   "
> > +RDEPENDS_${PN} +=3D "bash"
>
> Is bash needed or would busybox' ash be enough? If so, then changing
> USERADD_PARAM_${PN} to use /bin/sh instead would be leaner.

I will prepare a v2 doing it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

