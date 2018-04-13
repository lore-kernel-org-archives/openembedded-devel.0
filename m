Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8B64D7016E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 06:41:50 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id h55-v6so8763404ote.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 23:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=g7/Y/uHygpTu8eZap+UYzfiwrfsezxP82fJjqYUMq/M=;
	b=at1hKQPybFzFFc2E7fuN46agDveF0MW/JToEvAm9vRDlZJSx3dWkI9c8q5vhhbY/8e
	OzqK0sW+OsXUL8lePFWUHU6ckTKVUGuFgSTiOub+yX35j8Jw1yy5EqTsr1add7T1/iB0
	NQyb2kusdhaehuSe/YpDmlbUL0VxnHEZO0hofhas4VKvsMXwOM3kd63rv0PYgEfYTiJa
	ilDXGNcrzfihGJ3n/EPZAXNfxaL2CxCSY5XESfAvAR7gUEgSQalM3GTNa8r8FGII36Kp
	znyO+9TEpDtXN8LnzIMRNIZIsKJ9ko/T0tAHPsGgCM7Y/H4mIEZlrSu2WBhftMrRHzZ3
	XSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=g7/Y/uHygpTu8eZap+UYzfiwrfsezxP82fJjqYUMq/M=;
	b=HfMd1zjosl/nWuehQsADYMCv/H+UxQVKmh9c8qbGJshKCS/ps3n+gfukFIcGEJ9Vkh
	6uJcyV1svUOh78Q7ArI1PWKZHy+MlRsq1gAWB5LUzyl7xwksVTgMBKNKwsmdKGzJN4HD
	nWJgWlRHQ69k/wFoMTpGt+XDlHC8QsytWAvAsQoDfP7SIrduFj2eQbXIm8wQ60i2x+xA
	J/DqkiHSSKBoY2taXj5Q3cD4OMwgtjI2HY7EhYr43B9vTIqk5wF6UKkxs+Z+wrf2nktT
	2cigVuom3ScqbJe49g843I9fRE1V7RpmlKt2/mUh7FEN7gBwPLmsRKa8gleSp4ap5rX4
	X6NQ==
X-Gm-Message-State: ALQs6tBfD4xzPjMGWw2KXaiRZ7pqX90hBk2MjiYjFeV0bUObxWtShwZE
	RXqOOCFz6PTmUvGG8ER7OcCvwdZ7ELqpftO7q1g=
X-Google-Smtp-Source: AIpwx4/7qZCa9YBKcKETFWOcct/7tLI3N2HcOJUadqKmOz2S46Wq+OuxWht9vH1WXJi+WRzFMfzZ4nkhzfl6vgMnaIw=
X-Received: by 2002:a9d:38a2:: with SMTP id
	p31-v6mr2522169otc.299.1523601711269; 
	Thu, 12 Apr 2018 23:41:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Thu, 12 Apr 2018 23:41:50 -0700 (PDT)
In-Reply-To: <720f4b6d-e60e-9085-23ef-ef8edbcb0e80@windriver.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
	<20180330133151.25882-22-schnitzeltony@gmail.com>
	<720f4b6d-e60e-9085-23ef-ef8edbcb0e80@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 13 Apr 2018 08:41:50 +0200
Message-ID: <CALbNGRSx3K9pR7ANg8MfwE5ZnkxpSgAGJ_x7+yNGqS85m8fweg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 21/39] metacity: remove
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
X-List-Received-Date: Fri, 13 Apr 2018 06:41:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2018 at 4:53 AM, Hongxu Jia <hongxu.jia@windriver.com> wrot=
e:
> On 2018=E5=B9=B403=E6=9C=8830=E6=97=A5 21:31, Andreas M=C3=BCller wrote:
>>
>> * as far as I can see nothing uses it - please stand up if I am wrong
>
>
> On github, it is still alive and maintained
>
> https://github.com/GNOME/metacity/blob/master/NEWS
>
> I think we should keep it.
>
> The 2.*.* is based on gtk2, and the latest version
> 3.28.0 is based on gtk3.
>
> V2 which change the upstream incoming
>
> //Hongxu
>
Ok - let's re-add it. Are there dependencies requiring revival too?

Andreas

