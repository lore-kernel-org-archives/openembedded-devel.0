Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54437C3271E
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 03:27:27 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.4788.1720495641577037350
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 20:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iAgt2bN/;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-767506e1136so2469165a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 20:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1720495641; x=1721100441; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iElT9F/KrKzFGT0WiuJyymraHRD9gsr+FcIarjKgubY=;
        b=iAgt2bN/jJaKH0FiQNg4It0IoueBBNXWuAYYOdLeqRsjuV51Iq+h3ocf6sz0vdwm9H
         8F+oLo1YJiIRWqzzSikFiZppSlXnetmOjnxsgOiY4s0YpNR5npnIg1BG/wX2Fx6WclCF
         BpZuqlw9VN2xvfEYcTsORe17ZPyhuHUocalQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720495641; x=1721100441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iElT9F/KrKzFGT0WiuJyymraHRD9gsr+FcIarjKgubY=;
        b=IX9ZM1bu3M3CYFCSLHTtqr8I4nUoDCZXbMhh4FrSRqmOQkqYq9Bf8TeiQLgNSY46PP
         xX0dJ7DhBJvhrIpvqI3I656/lRiywvBw/nFq1em0G+MigLcHr7cyWWlzmRCLxWSa3o+V
         Q2Xzoi7jb0GAlJE138FEslCQJBCJI6n6p1MAI0KnMuga8HUg2G6CAkyVT6KkY2NxL1KU
         LZyyUWtLZfPPBJcll/tVm3yTIyX3fhQT8QI4wx+UjItU43rdWhH7epLfGTqOvZOIQa39
         xfHmHJ1t9FVbNPofeaPfQeFTyt+sPYRDKVhdvyyWakUtM/DAvZpVphHa/idWwY1Y6YAz
         07zA==
X-Gm-Message-State: AOJu0YwKQQnPHeoP00imIiHuY/tfcdKveRsS8Meva1do6X+DNHyNM4yQ
	VY6nf0aPetTGKmDw3zEq+Vhb3QewHGFAI2RhuVTgmQ3+bFrQKAwsCRxZqP2SDBY=
X-Google-Smtp-Source: AGHT+IFq+0hZBhjQtm1GQjHJs9JlnbweJSONbMjjWdDX248UZy+87TCBogRKfaLx4u5GArCWYdJk8w==
X-Received: by 2002:a05:6a20:72a8:b0:1c2:8a69:338f with SMTP id adf61e73a8af0-1c298c2c388mr1553027637.12.1720495635950;
        Mon, 08 Jul 2024 20:27:15 -0700 (PDT)
Received: from [192.168.1.9] (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43898b03sm657358b3a.8.2024.07.08.20.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 20:27:15 -0700 (PDT)
Message-ID: <b9c9fcb2-cf9b-4156-8d12-0fa2f96da5be@mvista.com>
Date: Mon, 8 Jul 2024 20:27:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] net-snmp: Set ps flag value since
 it checks the host
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240709004123.1330033-1-jpuhlman@mvista.com>
 <CAMKF1srskTrmMq84r=Cb60yZnBkbDu_hL7eWc8CnHVqF1Vvcuw@mail.gmail.com>
 <ac4cf2fb-f54d-4c75-83dc-e0bc7619ec6b@mvista.com>
 <CAMKF1spUGyrDXNmOgYJy3Q44+RwJgk1OGr36jJUoEpPJm81URg@mail.gmail.com>
Content-Language: en-US
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: <CAMKF1spUGyrDXNmOgYJy3Q44+RwJgk1OGr36jJUoEpPJm81URg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 03:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111276



On 7/8/2024 7:20 PM, Khem Raj wrote:
> Hi Jeremy
>
> So it seems only needed during build it seems ?
>
No the value is used in the /usr/bin/net-snmp-create-v3-user script that 
ends up in the
devel package. The value is checked during the build, but used on the 
system.

The value is placed here:
if @PSCMD@ | egrep ' snmpd *$' > /dev/null 2>&1 ; then
     echo "Apparently at least one snmpd demon is already running."
     echo "You must stop them in order to use this command."
     exit 1
fi


Where PSCMD is concatinated by PSPROG, already set in the cached values and
ac_cv_ps_flags which the patch adds. The configure script attempts to 
ascertain
what the correct flags are via:

if test "`($PSPROG -e 2>&1) | $EGREP ' (ps) *$' | awk '{print $NF}'`" = 
"ps" ; then
     ac_cv_ps_flags="-e"
elif test "`($PSPROG -el 2>&1) | $EGREP ' (ps) *$' | awk '{print $NF}'`" 
= "ps" ; then
     ac_cv_ps_flags="-el"
elif test "`($PSPROG acx 2>&1) | $EGREP ' (ps) *$' | awk '{print $NF}'`" 
= "ps" ; then
     ac_cv_ps_flags="acx"
elif test "`($PSPROG -acx 2>&1) | $EGREP ' (ps) *$' | awk '{print 
$NF}'`" = "ps" ; then
     ac_cv_ps_flags="-acx"
elif test "`($PSPROG -o pid,tt,state,time,ucomm 2>&1) | $EGREP ' ps *$' 
| awk '{print $NF}'`" = "ps" ; then
     ac_cv_ps_flags="-o pid,tt,state,time,ucomm"
elif test "`($PSPROG ax 2>&1) | $EGREP ' (ps) *$' | awk '{print $NF}'`" 
= "ps" ; then
     ac_cv_ps_flags="ax"
elif test "x$PARTIALTARGETOS" = "xcygwin"; then
     ac_cv_ps_flags="-e"
elif test "x$PARTIALTARGETOS" = "xmingw32" -o "x$PARTIALTARGETOS" = 
"xmingw32msvc"; then
     ac_cv_ps_flags="-e"
else
     { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: Unable to 
determine valid ps flags...  defaulting..." >&5
printf "%s\n" "$as_me: WARNING: Unable to determine valid ps flags...  
defaulting..." >&2;}



However the value ends up in the script. We got a wierd build error 
where a sshared state was built and got -e
and the mulitlib version got auf or something similar, which caused the 
scripts to conflict. For the sake of
reproducablity, we should set the value to one value so it is the same 
for every build.

> On Mon, Jul 8, 2024 at 6:47 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
>
>
>     On 7/8/2024 6:00 PM, Khem Raj wrote:
>     > On Mon, Jul 8, 2024 at 5:41 PM Jeremy Puhlman via
>     > lists.openembedded.org <http://lists.openembedded.org>
>     <jpuhlman=mvista.com@lists.openembedded.org>
>     > wrote:
>     >> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>     >>
>     >> The value the configure script uses is picked up
>     >> from the host machine ps, and there are cases when
>     >> the flag selection can be different. Which would
>     >> break reproducablity between builds on different
>     >> machines.
>     >>
>     >> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
>     >> ---
>     >>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>     <http://net-snmp_5.9.4.bb> | 1 +
>     >>   1 file changed, 1 insertion(+)
>     >>
>     >> diff --git
>     a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>     <http://net-snmp_5.9.4.bb>
>     b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>     <http://net-snmp_5.9.4.bb>
>     >> index 75b3d9e8c..989ec5413 100644
>     >> ---
>     a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>     <http://net-snmp_5.9.4.bb>
>     >> +++
>     b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>     <http://net-snmp_5.9.4.bb>
>     >> @@ -73,6 +73,7 @@ CACHED_CONFIGUREVARS = " \
>     >>       lt_cv_shlibpath_overrides_runpath=yes \
>     >>       ac_cv_path_UNAMEPROG=${base_bindir}/uname \
>     >>       ac_cv_path_PSPROG=${base_bindir}/ps \
>     >> +    ac_cv_ps_flags="-e" \
>     > While this change seems ok, I wonder if then we also need to ensure
>     > that procps provided ps utility is rdepend'ed upon too.
>     All the usage there is to see if snmpd is actually running. Any value
>     that works for all of them would be reasonable. I thought the
>     assumption was that busybox was always on the system and busybox ps
>     accepts -e with an output that should work. Probably
>     don't need the rdepend, If base busybox is still assumed.
>
>     >>       ac_cv_file__etc_printcap=no \
>     >>       NETSNMP_CONFIGURE_OPTIONS= \
>     >>   "
>     >> --
>     >> 2.35.7
>     >>
>     >>
>     >> -=-=-=-=-=-=-=-=-=-=-=-
>     >> Links: You receive all messages sent to this group.
>     >> View/Reply Online (#111270):
>     https://lists.openembedded.org/g/openembedded-devel/message/111270
>     >> Mute This Topic:
>     https://lists.openembedded.org/mt/107114904/1997914
>     >> Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     >> Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     >> -=-=-=-=-=-=-=-=-=-=-=-
>     >>
>
>     -- 
>     Jeremy Puhlman
>     jpuhlman@mvista.com
>

-- 
Jeremy Puhlman
jpuhlman@mvista.com


