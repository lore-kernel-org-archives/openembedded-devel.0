Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC376C1F6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 19:43:10 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id k6so20727885qki.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 11:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WGT1QZ471r5cQlkrKzgQllwzgKWbqvLObE/3KvX2gjk=;
	b=hDIi40GbtxjxCvpMD0LbQWXzeb7tumvO40uLwK0YvpyhMHo8GIRloXSBJx35t6AIOy
	DZIKPNIalkZNBXvbhKd7lxDWK5qb7hzXILf5RYo7V8Y1Awp5u4uHCL4DjRDEhrgqcjlC
	tbaRiU0dJ0pvYuUDGU3uv4bfXru/ViBHbY3NVe19+ehzK/Ql4ld1982gff/hx9Z82s9I
	49XpF80cjU+crgSs2iN1uWg+RIk4sWxId20bjGtxe3xEw/NqWyUD/ZyKqlpGJ73DSfpX
	F3U4IgjLLyfCyYVj/973E0kyrpmX0Im7oAToUxOxQ64JNzCxEjy1Z0DQbsXkT8yI1Ti/
	5lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WGT1QZ471r5cQlkrKzgQllwzgKWbqvLObE/3KvX2gjk=;
	b=roWFcVNf1WglShb7/euteo0+x+0CBehKpQtk4TpszFdevgP+SA90jCc0yiG0yujbzp
	9PGtH4tNbH6Auvs3ldtJ0tHLIdceIpXD90HpYR8BQ7bTKgvF4zgULgVthbESiu+4TTak
	AM6qVwCBk3JW+hWp6o5NS4Xr2hJB8stJRujFBJhA1y4JmheXO/mKNMYH2tc+Sr5huFwJ
	cf2shB+UogdhjEraZmwiEWiB5Bp7aMPeHxh27SiDzUnTFpm4n68aFipLvQuoqD7f0wgw
	bWGlrXwY7NH4s0y7IBu4KSZ/9vuQWVo725+e/6hPM4hTLYVWw9CXOWMRsYOXcOpxffqD
	7yhA==
X-Gm-Message-State: APjAAAVcSNX6OWhxoPDgJqm0bITWt7Ew/E3tdxMF7TNXBlprCC/fmZ81
	6RREXF9gWPwB2uGM8fs48Ie4SmCSv8+XgYJAKHU=
X-Google-Smtp-Source: APXvYqzBcUQjVwJ49ZQFC6gG1FMSlO9LO09F3ETypqHtRwWtBaEsR27WNbciT4vRmnMk7gG1gRzAp6Q4VwWyvYAUpZU=
X-Received: by 2002:a37:de05:: with SMTP id h5mr4736193qkj.474.1576093390708; 
	Wed, 11 Dec 2019 11:43:10 -0800 (PST)
MIME-Version: 1.0
References: <CANSQD5+CcEbaHxdfR8cjqdc6maXhrCgXy3eXrGD0dMgpiM_0LQ@mail.gmail.com>
	<7e5b400c-9c07-ff0d-df4b-9ca0329bfdbc@intel.com>
	<CANSQD5+e24bohovGjVgagiFrizqu2sj0SwzJWn+17tUJCthO_Q@mail.gmail.com>
	<CAHtQpK4zNtju4Own7yx+bTZsmyycW2dXoB0JOA=566X=h89wMw@mail.gmail.com>
	<20191210205704.wkwzy2kpgq2nqam2@vctlabs.com>
	<CANSQD5Ju4ZN7gW7GGm6ELdG63LQDAe-gbn1aFXK4oO1Ta5NhZQ@mail.gmail.com>
	<CAMKF1sqnj-iczhgfww+J6=3pWKf6KLn4UWkuSz9cAhQCSqwmcg@mail.gmail.com>
	<721294ef-b4ea-ab49-19d0-82bfc8fff9b8@intel.com>
In-Reply-To: <721294ef-b4ea-ab49-19d0-82bfc8fff9b8@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Dec 2019 11:42:59 -0800
Message-ID: <CAMKF1sq45JgRZ761Bpkc7GS8od4Lf-_OfudiCoZUJE2ch+Ogxg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Building Linux Error
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
X-List-Received-Date: Wed, 11 Dec 2019 19:43:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2019 at 11:00 AM Ross Burton <ross.burton@intel.com> wrote:

> On 10/12/2019 23:50, Khem Raj wrote:
> > On Tue, Dec 10, 2019 at 12:57 PM Kamel Ghalgaoui
> > <kamelghalgaoui7@gmail.com> wrote:
> >>
> >> For information, I my kernel version is 5.3.11 and I have tar version:
> 1.26
> >> $ which tar
> >> /usr/local/bin/tar
> >>
> >
> > Interesting. I wonder if we should poison /usr/local for hosttools.
>
> Probably not a great idea, as people may be installing stuff in
> /usr/local *because* their /usr is old.


That means we are letting the default tested distro information not convey
what it means. Perhaps it=E2=80=99s. Better to blacklist it and then let us=
ers
enable it explicitly so they know what they are doing

Otherwise these kind of issues will always keep coming up where an tested
distro with local overrides will do unexplained stuff

>
>
> Ross
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

