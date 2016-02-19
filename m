Return-Path: <samuli.piippo@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDFB77045
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 08:06:07 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id g62so63732279wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 00:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=WssUNrW0Dvl/Sfwy/N7A57Q4EfqEUVnfPl8drNE+Zs0=;
	b=rimzw3HnmkQlEaIm7E88/f/eCfhCoQPUKro5DZ/1WV+q8bhcbo5K3gi+/f2/On5Itv
	K0D7jSDxlhNqT76qGe44gdJKHXuJzXbbp2wfk/5liM+iiQumi6UeOIUt+SzGvom9reyQ
	QfS9oJGDxaQYJHpUqewVBmZxCAHgiBk0dF6yviD3TPIU7YUF8ddD5Ren9MenOKEPFu1G
	ljME+4i5PKDAQxRdIVnDgbvmSX46a5EkaPphRKV+fwokeRJ2l1IGB5Zq2HE86LRWikMz
	bYu0JgpivQjjr/IjsznA+KqtHYDcVnCH1TYfDlUwEYN/KPg8jbw/IMQrJmwL7Y7HmsPp
	zT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=WssUNrW0Dvl/Sfwy/N7A57Q4EfqEUVnfPl8drNE+Zs0=;
	b=bY7KJXS1O8qU0SeDnaZ6lf1isHnbzHUg5jXEet7TaXS7J7bR8v0zsAQKXAIOJuSY34
	6EHkMpKech63ezgshTx5UFTiAymuHLLBGyWslAoeZivYO2hOX5hEaHhVNuV8bPNBj/eM
	rMuLCDSdtPv1HbKamRhHNXvdRWFrt38FODaoI9ypxvD71V4NFUW4P20B8OcrUbCkgsrO
	3Jh+PSlemU4nsRGYVynjq+qCOqE22b3u0XBFsQLwGai7bk3w8crdHy/0e5ytPxPRTBIu
	jyrTyLtFfXpWWI4Hi3CStm1rCQeOU5hfdyLPqubP4vL+92jeObbNBAQ/1/Ot/5TATIbe
	6jsg==
X-Gm-Message-State: AG10YOR3DdJRJ+PaFYvn5h8YkL0ELHfCzmXwrV7EI62FTUTQk4s6kAxJgUkVo3RFF7aWtA==
X-Received: by 10.28.195.9 with SMTP id t9mr7923376wmf.9.1455869167875;
	Fri, 19 Feb 2016 00:06:07 -0800 (PST)
Received: from [10.9.5.47] ([91.217.248.11])
	by smtp.googlemail.com with ESMTPSA id
	ll9sm10013899wjc.29.2016.02.19.00.06.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Feb 2016 00:06:06 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1454512359-2140-1-git-send-email-samuli.piippo@theqtcompany.com>
	<CAP9ODKo9D=V8w1-oJmz605VsDWGtFJ=1raD+35yeSJCkRt-TSw@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <56C6CD05.7070300@gmail.com>
Date: Fri, 19 Feb 2016 10:06:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKo9D=V8w1-oJmz605VsDWGtFJ=1raD+35yeSJCkRt-TSw@mail.gmail.com>
Subject: Re: [meta-qt5][PATCH] qt5: use common PACKAGECONFIG to build examples
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
X-List-Received-Date: Fri, 19 Feb 2016 08:06:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04.02.2016 13:19, Otavio Salvador wrote:
> On Wed, Feb 3, 2016 at 1:12 PM, Samuli Piippo
> <samuli.piippo@theqtcompany.com> wrote:
>> Each Qt module's examples can now be enabled with PACKAGECONFIG.
>> Replace the webkit patch with a PACKAGECONFIG option and follow
>> common practice by not building QtWayland examples by default,
>> those can be enabled in a .bbappend with PACKAGECONFIG += "examples"
>>
>> Enabling PACKAGECONFIG[examples] in qtbase, will still cause every
>> Qt module to build their examples.
>>
>> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> I think in a subsequent patch, examples should all to be disabled by
> default. What do you think?
>

Sorry, I don't follow. QtWayland is the only module that has examples 
built by default, and this disables those as well.
Is there anything that's needed in a subsequent patch?

