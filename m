Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82231D77899
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:44:29 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1137.1769190259163458458
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eUqUmw2u;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8710c9cddbso325146866b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:44:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769190257; cv=none;
        d=google.com; s=arc-20240605;
        b=lLYaLIAtJITn3WH0ClsJbNI4MigVQhE5theImj1FAIhysGereRSocHJ2MJ6GnlPTlN
         AqIDH4NhZo6IWCE+tDDt8TLN+57WFLmmSNdE7dUnybiOTRkLJzFn5dR6EN0gWn6K7Qa4
         u1yqa0YGu9oyW8LD/40CvEMILDIn5WsjCgSUlqzxihJGQKNdbJjOjFbIzx+mMXrhGrCf
         PEXEmyxw/dssAkEXsUhugfSEfkN0hHvwTqMQh6mwgRx9x389hzMzuLi+lsGqVdey3vQe
         AG5GjdxwUn9omyfsE0WOLVEq1WhZ3/rK5kFUYrY7+X1EoSMo73ZJizrISzwmvN3R+1Ag
         IEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5Zm8pUMJ6J+M++vyeIkfu1K/VRh1xo231j7XsJahnsA=;
        fh=d6HXzyjkjrcU2+NDJi5oQlKQTPTBXzBFsZTP45+YwpQ=;
        b=J1J9emvcr9RqJysbRXrjE1cIdxlW3kNSIKZBBnVuypAHQSHcDoWh5X568+tmh9DvNI
         ueP1Cbm8Uk05LTDIQN47oyN8TXmyhRh9l8/ZFxLzmc6LZUEBvqziIE07HSAtwcMYBN08
         VyohLcFkh7Y1jOybkt/wlMhsg5fi4MZnUuL9aueEicL9nfpgiQhiJT1ILnqaDx22XfrA
         K1u7ADAEPnbVL6BFp9QE+LsmrX7rjObuZt0DNclu4+0IqfvcDhW2+5Mv4c1gQT37tK+d
         o6Vq2hC5QLQxI1eavF+bEBHfS7HbhmrUd7UvnaV9XliHIXpcK0jaweGZHxiqpl5hZFlj
         2QXw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769190257; x=1769795057; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Zm8pUMJ6J+M++vyeIkfu1K/VRh1xo231j7XsJahnsA=;
        b=eUqUmw2uLnMoQv9tggEkoGdO58QXXcuSDn/V3gGXTf5K+8T0Np27/jxsZM+qZgXPSR
         W8VNHM6Z2Qda283ucd+SS+0T6W8toOgHfPAUjgF+YBlmiv+cGvlZOw556RHDFKUim7Jb
         meLrsmgWibdF5jSvscggOl/mNLmhr2KGEHemPx74ZTBRNKkE2TK9cSR/1hNDcw14RpGn
         wW7Oa2jRFUZLjxJfqEhD+Z1Wg76ooY8nVjtDV6hRq+vEQnDdPH4MTNxkrwh9GEfed8Pu
         dHn4JmBU7iZer0yObLr65sAlrcVR+qLM91XjF/0A0djAcUf03e8O/19bB1trNOmTWzPp
         XZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769190257; x=1769795057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Zm8pUMJ6J+M++vyeIkfu1K/VRh1xo231j7XsJahnsA=;
        b=NP5j+qUZIyciQsXmPulM8AZdZmNqElZzL3m2H3sFX4/6gnSH1Dna4LVM0otFd2I3P8
         W5qDSyIH0+g/vqP6dedop2hz4/FLjKroMD9E4urGbceLH02gpMVbNTNGIMUiBQqbtL/y
         Q/gW/2uG0dNs/rFqFcU+MWQFJG/w7YC2XSx0gQNOzgc47XokPFYIu9hNeFBw/7+Cu0BT
         BeBMFSn/TJffvZZdjzg84bxOp7+o5/vaUfmzSjQ7RKF7qdHXUOP2WZefXp8/JT8baE3z
         IwIiOfRg6bpdWpE4j0oyFFT9fkbHh/NyIrGCzYO8RsVA9VMFY41LhmxBFwu3IpzyliyH
         kd/g==
X-Gm-Message-State: AOJu0Yz7xqJOFPoU6vnwtivtwj4GZ7LlaM/Yu9D6nZWTL3gBDE3LDdrl
	7ucxc2jLGn9fCtLn+HMmQ7RkOuf4MYtl/1XL39MLJkvm+p8+YQwVy0bQwO04GyhjtreovQ7uLg7
	7BoFclSYmGETDsKx8Y1xchO58SsSLL10=
X-Gm-Gg: AZuq6aJBYyC1TKILOxUg+nVLgbnPjnu9UoNGZ+cYgMX+u5OwRwmxi4+9W+V91LlPbk2
	cU/BDen2mH9KS1pGd8wOd8AedWSWgriiTXD4pl49DP5j89c9xDnzdnzNt+KMu0WqJCv9O8OMW1y
	iUX2qCNTdHvGawDz3Py6ltg/BHz7/56r3mqHJVn/Xb3QmqAa/eibA1CFSFIGt9JkxB18m+2l1xf
	+W3cUV2mfk6kc/o1ZMYK/di1SLdBOkPQAoyO3trpJTIevp/pv7XRA34skXz/ifhJcLo0vTlEA==
X-Received: by 2002:a17:907:6d13:b0:b87:9e78:401a with SMTP id
 a640c23a62f3a-b885ae98deemr222864466b.65.1769190257190; Fri, 23 Jan 2026
 09:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20260123094119.2665-1-shoudil@qti.qualcomm.com> <qawdkmgqz6wn7henpqymeijenllasbytf2w25s5jvzxxpoadt7@v2cvxnaiokul>
In-Reply-To: <qawdkmgqz6wn7henpqymeijenllasbytf2w25s5jvzxxpoadt7@v2cvxnaiokul>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 23 Jan 2026 17:44:06 +0000
X-Gm-Features: AZwV_QhyIdfC9ZK470bVFl0--ry-9hqmLpgvWnR7mNzyNaux79JzeVHFj2f4Bh8
Message-ID: <CANPvuR=fvHbHrCFpOBdE7OHPPQRu4yiX6mphj8sNx-1U6JKxiQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] android-tools-conf-configfs: handle multiple
 UDC controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>, Shoudi Li <shoudil@qti.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000d1ea29064911b495"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123798

--000000000000d1ea29064911b495
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> escreveu (sexta,
23/01/2026 =C3=A0(s) 17:34):

> On Fri, Jan 23, 2026 at 09:41:19AM +0000, Shoudi Li wrote:
> > For the boards with multiple UDC ports, adb funtion will be impacted du=
e
> > to below error.
> >
> > ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> > ls: write error: Device or resource busy
> >
> > Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
> > ---
> >  .../android-tools-conf-configfs/android-gadget-start        | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
>
> Same issues, forged From and missing SoB.
>

Yep in this one I forgot the --from on git send-email but I didn't notice
that the author was also wrong.


>
>
> --
> With best wishes
> Dmitry
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d1ea29064911b495
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Dmitry Baryshko=
v &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm.com">dmitry.baryshkov=
@oss.qualcomm.com</a>&gt; escreveu (sexta, 23/01/2026 =C3=A0(s) 17:34):<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Jan 23, 202=
6 at 09:41:19AM +0000, Shoudi Li wrote:<br>
&gt; For the boards with multiple UDC ports, adb funtion will be impacted d=
ue<br>
&gt; to below error.<br>
&gt; <br>
&gt; ls /sys/class/udc/ &gt; /sys/kernel/config/usb_gadget/adb/UDC<br>
&gt; ls: write error: Device or resource busy<br>
&gt; <br>
&gt; Signed-off-by: Shoudi Li &lt;<a href=3D"mailto:shoudil@qti.qualcomm.co=
m" target=3D"_blank">shoudil@qti.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../android-tools-conf-configfs/android-gadget-start=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 6 ++++--<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
Same issues, forged From and missing SoB.<br></blockquote><div><br></div><d=
iv>Yep in this one I forgot the --from on git send-email but I didn&#39;t n=
otice that the author was also wrong.</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000d1ea29064911b495--

