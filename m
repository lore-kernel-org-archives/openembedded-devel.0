Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B14E74AC3
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 17:00:45 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.25387.1733245242801656297
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 09:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j35YKjxE;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3ea4acd3ed2so2473941b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 09:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733245242; x=1733850042; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xLKxFly/sXUMl/DUq2xzo9Et2AB0PJJQ6rpdchqDDE=;
        b=j35YKjxEBYVIVQcHO77TXPakvwwQNUiK06SlovOeDM9caMI83WzcYFzr4KnNKY3Qwq
         U8QsP/aOcMSdvgygnQsQ+TEbtVBZ1SXQn8t8DTpe9r15znvPqHYyORS2eF9bLcxhpjSk
         lzNhH6UkbADA/7nkBGqCRk0xYf30Y2RPHpbTq87bx8wyCAf//62e+UEoC80+8O953dii
         9a9DFospYR2tMn8QpDMS+UIXmFIUS9kOkhA+bWL4ONp5+vng9pfZ8ej5hkDcjwMemgVN
         jy87qwAlyvT3XXNN8zucpnnu8GtS/6OnT3gR2qpYZdYBT7h11GEebxiMiOuMpUQ9wAMa
         q0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733245242; x=1733850042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xLKxFly/sXUMl/DUq2xzo9Et2AB0PJJQ6rpdchqDDE=;
        b=BNZVAE4f3SBpCmPrw0pyy378Cla66rJ+KCzXwTLeKAlcVClJu+h+50amBik72DEMmH
         H4fH5lBMQt9k/nbLqoHYdfplslssE6tMPhu/NvalNFa8D3RgrTF2RzLntRv6aPGC2I/H
         zsrAUyhpph4sEI7sqblelSleADhXZhb5x/vO563l9ItGb0ffpLFS3t0I673Xn3Xp6BS7
         +RhCshYWkgruU46EZsM9T++QTMXHMldG88wcBl4LQ2A846zwG89ZCOf5qjd7UhgusfUo
         gJD4xfbtFIOhfJAC5raQlBs1rYZ0mG2OONsf8Mt6IAZ9Z5iJ6b6aGJkkT1w/tVeyjlRF
         CDBw==
X-Forwarded-Encrypted: i=1; AJvYcCUKOk8sN/g3pNw67Oj8LNjHOdWHCJi7tYJzn6V9akVA+I+FGr0OYSY01G5K76oQrkZIceaKujh1FwFXP+vUIsZyRhI=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yycs8jaBzpLre0V9n0ckRruzaet2fDS1FhqW1IbWmPUKg/0czDu
	MSMxCUtQm4PJenC1FpFaR+iWTsZNwq0IY04ITGMw0pUG4YFwPIyNKZQOzPj/anAWnXTxGdpqfbc
	/bvmLzInkqcXm6zg+070rYWEHbh0=
X-Gm-Gg: ASbGncua0zzJS2YsISztByHyaDO5BHayHGfUIQkmFHEKATaMH7gRLuvxbqWVHYk0hOp
	opgn6+qcUCMsXu4/5YwpUfqP9lWFIPw==
X-Google-Smtp-Source: AGHT+IHXIB/e1fHmJ/QGu61z3Yp9Cn0JnmB7fOSMM71Z7Uf6BenT0VpnmLWjl43EskRf+bjy2eIk/TlAEn5NwMIYtsY=
X-Received: by 2002:a05:6808:200e:b0:3ea:64cc:4972 with SMTP id
 5614622812f47-3eaf03bab8cmr635455b6e.30.1733245241839; Tue, 03 Dec 2024
 09:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20241130124846.232284-1-johannes.schneider@leica-geosystems.com> <5ce10539cc5280e1b26fbfae7c0e00e193223ee8.camel@pengutronix.de>
In-Reply-To: <5ce10539cc5280e1b26fbfae7c0e00e193223ee8.camel@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Dec 2024 09:00:16 -0800
Message-ID: <CAMKF1srYtecYEBMk9GT+EvqGK-Qy-XC7NZcwZXAtUx+CeDvQEw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v1] signing.bbclass: add set|get|has_ca functions
To: =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>
Cc: Johannes Schneider <johannes.schneider@leica-geosystems.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 17:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114186

On Tue, Dec 3, 2024 at 8:45=E2=80=AFAM Jan L=C3=BCbbe <jlu@pengutronix.de> =
wrote:
>
> On Sat, 2024-11-30 at 13:48 +0100, Johannes Schneider wrote:
> > Add a mechanism to establish a (metadata) link between roles, in the
> > form of a new 'ca' variable.  Which is intended to point from one role
> > to another, to preserve the leaf->intermediary certificate relation.
> >
> > With this additional mechanism, it would be now possible to import a
> > complex PKI tree of certificates (either just the certificates, or
> > both cert+key where available); and then later during usage of one
> > role, reconstruct the verification chain from the leaf, through
> > multiple intermediary, and up to the root role.
> >
> > Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.=
com>
>
> No, as explained in the other thread, CA certificates are *not* roles.
> A possible extension would be that roles refer to a CA certificate. We
> should continue to discuss this in the thread "signing.bbclass: add
> set|get|has_ca functions"

perhaps a plugin sort ?

>
> Khem: This should not be merged in the current form.

yeah thanks

>
> Jan
>
> > ---
> >  meta-oe/classes/signing.bbclass | 34 +++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.=
bbclass
> > index 8af7bbf8e..f1765e96b 100644
> > --- a/meta-oe/classes/signing.bbclass
> > +++ b/meta-oe/classes/signing.bbclass
> > @@ -246,6 +246,18 @@ signing_import_key_from_pem() {
> >      signing_import_privkey_from_pem "${role}" "${pem}"
> >  }
> >
> > +# signing_import_set_ca <role> <role_ca>
> > +#
> > +# Link the certificate from <role> to its issuer stored in <ca_role>
> > +# By walking this linked list a CA-chain can later be reconstructed fr=
om the
> > +# involed roles.
> > +signing_import_set_ca() {
> > +    local role=3D"${1}"
> > +    local ca_role=3D"${2}"
> > +
> > +    echo "_SIGNING_CA_${role}_=3D\"${ca_role}\"" >> $_SIGNING_ENV_FILE=
_
> > +}
> > +
> >  signing_import_finish() {
> >      echo "loaded objects:"
> >      signing_pkcs11_tool --list-objects
> > @@ -346,6 +358,28 @@ signing_get_module() {
> >      fi
> >  }
> >
> > +# signing_get_ca <role>
> > +#
> > +# returns the <ca_role> that has been set previously through
> > +# signing_import_set_ca; or the empty string if none was set
> > +signing_get_ca() {
> > +    local role=3D"${1}"
> > +
> > +    eval local ca_role=3D"\$_SIGNING_CA_${role}_"
> > +    echo "$ca_role"
> > +}
> > +
> > +# signing_has_ca <role>
> > +#
> > +# check if the role links to another role that is its certificate
> > +# authority/issuer.
> > +signing_has_ca() {
> > +    local ca_role=3D"$(signing_get_ca ${1})"
> > +
> > +    test -n "$ca_role"
> > +    return $?
> > +}
> > +
> >  python () {
> >      signing_class_prepare(d)
> >  }
>
> --
> Pengutronix e.K.                        |                             |
> Steuerwalder Str. 21                    | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany               | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686        | Fax:   +49-5121-206917-5555 |
>
>

