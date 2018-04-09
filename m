Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 105B771985;
	Mon,  9 Apr 2018 08:53:43 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id x9-v6so6855301oig.7;
	Mon, 09 Apr 2018 01:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zD7CXblGxomFV0rMgg7DRXjwVkWGiS1Rt2l7hMy/qx8=;
	b=TdEoprjDE5lLFV687bqdMdG+n9Ud2T2vEhnG6i09gJeOJmxVaC1rDJ0WfhuQQac7St
	OO9SpwQCf5n9KBqlkp87lulM/RDnZhcKaG6Ed8Pb4e+LyZcdVx21+kmHz2L0dTu0P+tr
	Biw8cDM+3lCqHDDrpHqq05bYHnuz8fawdPlr+Z6RLTWEBFyakvGHkn9BYPZWgreD9opE
	gTHxlFxniEnU/WizyUqOPZeZnDZ3QyG3yIQTv/vJAtmoJ8pIreRR/wfUdIQwWjS8OBrr
	oNhiX2TqcF9JfIslf3CgjBHdQS9mTIpLiwbEGpmUTiYe4VjIeOvKfMvtMaKqQPLx8/GQ
	Y9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zD7CXblGxomFV0rMgg7DRXjwVkWGiS1Rt2l7hMy/qx8=;
	b=S8JJuQM4LJ1n88cn0tNbPI8o+AdMkHqxYdobxw7mqTPlJq75uiBe1LiPhnpmSS3z+L
	IH1EG978wvGa7mBuO/+6cvAe2z25xsomwtTzNMybSN1bT8BZfsxmoqGtKTcRNJ6EDzjo
	q0QQP6UOhq/ylcSFxMC16y2SniWdGuyGoLSsBaZjjsj6WHMKV+f1bHAbobbXo5U51XBs
	vfHOwBCbEciNeBQ9HF8GDrKUwCRI8yCM8/DJWaR/pXEMRbGR3DHbzoUdQfZemrxmSis/
	kY1PvdIeGlWcE4o7st8L35yDCe6xmNej6nnVceMheJ71iKz7DnI4xlqoiRZ588by9qrI
	1JUw==
X-Gm-Message-State: AElRT7G1Tby5aP+HjODBkU6kgpHwPLOLht1xNyiviUPgHhgOzjbWoVoY
	rXEl1dBW0Q48vAIOuKcWsgsfOZwp1b1HkMKezPc=
X-Google-Smtp-Source: AIpwx4/1OQs1G5jDSCXOmcfwWzJaqC5K5u1l8OcS7R2vP7m+VxRGj4pjeZccE+GGxyFreu75B6LZMnOw9YBvbKmjQus=
X-Received: by 2002:aca:6254:: with SMTP id
	w81-v6mr20024549oib.251.1523264024566; 
	Mon, 09 Apr 2018 01:53:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Mon, 9 Apr 2018 01:53:43 -0700 (PDT)
In-Reply-To: <CALbNGRT1-EoonDVYHXgUGc07E=sHn_6ictMJTGcrGB62DsUB5w@mail.gmail.com>
References: <152236802127.22760.4484042389285225479@git.openembedded.org>
	<20180330000021.9214B232BA2@git.openembedded.org>
	<CALbNGRT1-EoonDVYHXgUGc07E=sHn_6ictMJTGcrGB62DsUB5w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 9 Apr 2018 10:53:43 +0200
Message-ID: <CALbNGRTZjS7NH-apRc2uuXJAiK9=HBi3W9P1yoc5S7U6pX8_3w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 01/90: poppler: update 0.57.0 -> 0.62.0
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
X-List-Received-Date: Mon, 09 Apr 2018 08:53:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 9, 2018 at 10:50 AM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Fri, Mar 30, 2018 at 2:00 AM,  <git@git.openembedded.org> wrote:
>> This is an automated email from the git hooks/post-receive script.
>>
>> armin_kuster pushed a commit to branch master-next
>> in repository meta-openembedded.
>>
>> commit 2a8a5b5cd0258657e145f65f54c3145e42116f7c
>> Author: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> AuthorDate: Sun Mar 18 20:08:33 2018 +0100
>>
>>     poppler: update 0.57.0 -> 0.62.0
>>
>>     * poppler moved from autotools to cmake
>>     * qt4 backend was removed
>>     * build tested with all and none in packageconfig
>>
>>     Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
> Oops - it failed on autobuilder and I suggested to keep 0.57.0. Think
> it is some race when using a high number in PARALLEL_MAKE. Now that it
> was applied I have get it reproduced and fixed...
This is master-next notification but it landed in master either...
>
> Andreas

