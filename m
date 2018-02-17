Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id EE0B0782E7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Feb 2018 18:39:13 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 47so3860159uau.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Feb 2018 10:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b0ChBzk0JP6Dn1KhpFB8SPGky4q4FcDqQ1t0eq8Ajr4=;
	b=opFq+ZMm69rf7PMa/M61FNwH1kgAxBrfH/0wlwahPoKhOqk5p0rlnW3YV+KLh0h/9a
	Y+ZjPuuWQ3igfEPqg9SEkdr3qtvuBiZjLK9Ta3mhKWvt0x6Ru7cdo5O1sMTlm0buAFXp
	/+uKzAlnfONHXIDULkkNDfVuhvgvz6YgVOf6q5xu89ahsuH2SYbEGTZzr5vcOGPH1UFJ
	d/ISZ+zlK1JaM1Cme3T7tdjzPkjbc/2OQJmfnKo9Bgkj6E0bc/I3j0jbWI2CtMJgQ/mz
	rXAva+a0hTHf51NLIVy1teNHKYufdv+QKWVhBGi1pWFayBwJccxRLia77AuOe5gKtkMd
	T+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b0ChBzk0JP6Dn1KhpFB8SPGky4q4FcDqQ1t0eq8Ajr4=;
	b=lcwoKVjQTfBAzXt2VvcBG78QkfMN3l8RrpuDa+IoSDUQ5idgx1t1mco+r4RXACDll+
	vgIWj/GN+rUOHlr69ljQjA8z7Ll1mltEEg+ELjJv+vieb32py6Ih00RbqylfVB1U1Dht
	pqao2E38iQ7jgUTS3oKhXCZM9HMsV2yQQMZHkbAk4UNjDdm4/7HIsS8gB0zcyCg61Jwi
	MGgoICDv9OVlnqk0PyHoYNV4KcN5EWfNs9VKW74hhNDj1iLZPrdtrnOuhbXjrc8kRhTe
	bvF9bEKxlY0NgFZw5qOYz3fxIWgVXEpbjB/zhdf9iKW9T2qLKyGh1WxmHpxxEngtmu0A
	F8sQ==
X-Gm-Message-State: APf1xPBATrgqAm6zPE7Unf4PcJoCKT0t71Hy1uvVA3HyJlXqG1JtP+BQ
	2N5qs3YDtUi8yZUFbhg+NrKl7rCkKh4lnEz+CDI=
X-Google-Smtp-Source: AH8x225EFUnu1NKijB3APU/bku7YoDOUZotnyeUjCB5TQpTjfaltgaFVF/ixnsS43ORLn319CGuS5nzE0YbVLk19MCQ=
X-Received: by 10.176.3.23 with SMTP id 23mr7512679uat.7.1518892754412; Sat,
	17 Feb 2018 10:39:14 -0800 (PST)
MIME-Version: 1.0
References: <20180216213511.117-1-Martin.Jansa@gmail.com>
	<1518819754.6900.50.camel@gmail.com>
	<CA+chaQcKXbteCmzE7SCZdZ5zjBnnAefyH+JdJDGChKmUpNvG+g@mail.gmail.com>
	<BA94AA8C-F764-4EC2-ABA5-6ACC1E805F90@linux.intel.com>
	<CAJdd5GZ6ga96Gzue=FD8qTOrg=faKxojYZWtxY4RiC9KAOF5Sg@mail.gmail.com>
In-Reply-To: <CAJdd5GZ6ga96Gzue=FD8qTOrg=faKxojYZWtxY4RiC9KAOF5Sg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 17 Feb 2018 18:39:03 +0000
Message-ID: <CANx9H-AuFEh6XuVNd7gk_mAfba8RzBiGqNNUZcHDZaNrxgb1OA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] waf-samba: use new oe.utils.parallel_make_argument function instead of removed get_waf_parallel_make
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
X-List-Received-Date: Sat, 17 Feb 2018 18:39:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right. I had backed out for meta-virtualization linux-yocto bbappends
failures.

On Sat, Feb 17, 2018 at 9:25 AM Joshua Watt <jpewhacker@gmail.com> wrote:

> On Feb 17, 2018 10:39, "Tim Orling" <timothy.t.orling@linux.intel.com>
> wrote:
>
> Now libevent fails:
>
> 08:35:10
> ERROR: ExpansionError during parsing /workdir/openembedded-core/../
> meta-openembedded/meta-networking/recipes-support/libtevent/
> libtevent_0.9.33.bb
>
> 08:35:10
> Traceback (most recent call last):
>
> 08:35:10
> bb.data_smart.ExpansionError: Failure expanding variable do_compile,
> expression was     python ./buildtools/bin/waf
> ${@oe.utils.parallel_make_argument(d,
> '-j%d', limit=3D64)}
>
> 08:35:10  which triggered exception AttributeError: module 'oe.utils' has
> no attribute =E2=80=98parallel_make_argument'
>
>
> Make sure you have the latest oe-core
>
>
> > On Feb 16, 2018, at 3:10 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > This is just to fix the parsing ASAP, you can still send your updated
> > change which removes the waf inherit completely.
> >
> > On Fri, Feb 16, 2018 at 11:22 PM, Joshua Watt <jpewhacker@gmail.com>
> wrote:
> >
> >> On Fri, 2018-02-16 at 21:35 +0000, Martin Jansa wrote:
> >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>> ---
> >>> meta-networking/classes/waf-samba.bbclass | 2 +-
> >>> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-
> >>> networking/classes/waf-samba.bbclass
> >>> index e490176241..a63842cadc 100644
> >>> --- a/meta-networking/classes/waf-samba.bbclass
> >>> +++ b/meta-networking/classes/waf-samba.bbclass
> >>> @@ -87,7 +87,7 @@ do_configure() {
> >>> }
> >>>
> >>> do_compile () {
> >>> -    python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
> >>> +    python ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d
> >>> , '-j%d', limit=3D64)}
> >>
> >> Ah, beat me to it. Either way, I approve FWIW.
> >>
> >>> }
> >>>
> >>> do_install() {
> >>> --
> >>> 2.15.1
> >>>
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

