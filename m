Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D215677101
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 10:51:50 +0000 (UTC)
Received: by iofh3 with SMTP id h3so14201649iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2015 02:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=CbyBWWOkxNBGn8yefg+1i7URO7ilt4MBMhjtvWCJ2sw=;
	b=Gxh6fDbmWi44bPnBS3JBAvCQETGzxCTAW+NlGvU/oW0Q6+Vg+ITbtVhczB1XfiQgF1
	pNZZMd7yF3pkdok/VQ9jJ+nOv1v/XbU+Xu53ZQHFs/VGJtpXzMvHbRMIVxezfpECNK0a
	TXrpXZRIlRB9UN/i50s+Y1o3SatqVUPYJUNQ7PqZDoEYCYDMP7gd2fv0fCI+LSYJ4HIn
	qe0eegR4nfiBgVJJyrxPKd3tGj+vDsgjB/wQ9hCi2Q+5KCSKlEltv38SNonK1XLU4a5i
	rOvjCnEejLXLHXX2W1Pub9Tk+iO616U57hk45ZmpjUnd/CqEAOHzyD1MwsC60SmBtyL7
	P+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=CbyBWWOkxNBGn8yefg+1i7URO7ilt4MBMhjtvWCJ2sw=;
	b=NJxQDEe+Ef6qkWyY+ONiPe6vSW6iend4v2KOIf+BHrjbRw1QVvzitaRYUs/F1WdE1e
	1VvwAk7mSJbB52G5wP59lRRaSykL434be9jHpTlLR5RjcZRxwTAerhKG5uPpE/yxG9Aq
	1e3bU7lmNbxT5paF8VuTCRsZxM54NCeH77mV0J7tyISRB67mpztva/ZKa+ya+VX6lTbX
	ug6mrCbMwOSi02KTvkWaT2oxSnUwXC/gi7/d847aYDQ+/Zhz/D8f3lXgQnZbEII2/QBY
	FFB3GhwLL9irmF3RyBjefnDWepIOtkycsN4SUIiC1bGfprOeyGPeMpZxMhBJlhx7ew7f
	Y08A==
X-Gm-Message-State: ALoCoQloTbkKvEQJhILaT69x8NR/HBBu2UBR3ANxBPtfNH4bwGSaNtf4px0rYmBeZT5biCVrrRKn
X-Received: by 10.107.30.146 with SMTP id e140mr25593827ioe.121.1447066310379; 
	Mon, 09 Nov 2015 02:51:50 -0800 (PST)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com.
	[209.85.223.180])
	by smtp.gmail.com with ESMTPSA id e1sm4720493igx.6.2015.11.09.02.51.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 02:51:49 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioc74 with SMTP id 74so115668598ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2015 02:51:48 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.17.160 with SMTP id 32mr17725464ior.28.1447066308870;
	Mon, 09 Nov 2015 02:51:48 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Mon, 9 Nov 2015 02:51:48 -0800 (PST)
In-Reply-To: <05423CF5-47B2-439F-A64C-F89B5F9BEFD8@gmail.com>
References: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
	<1446898829-21243-6-git-send-email-max.oss.09@gmail.com>
	<05423CF5-47B2-439F-A64C-F89B5F9BEFD8@gmail.com>
Date: Mon, 9 Nov 2015 08:51:48 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrMMxvOY02BGF__TToUMiUGdveB5FqSWn+-yEkiLVZCFA@mail.gmail.com>
Message-ID: <CAP9ODKrMMxvOY02BGF__TToUMiUGdveB5FqSWn+-yEkiLVZCFA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH v2 5/5] cef3: fix build with gcc 4.9.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Nov 2015 10:51:50 -0000
Content-Type: text/plain; charset=UTF-8

Max,

On Sat, Nov 7, 2015 at 5:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Nov 7, 2015, at 4:20 AM, Max Krummenacher <max.oss.09@gmail.com> wrote:
>>
>> During the final link we get errors like this:
>> .../4.9.4/ld: warning: hidden symbol 'sqlite3_temp_directory' in obj/.../sqlite.sqlite3.o) is referenced by DSO .../usr/lib/libsoftokn3.so
>> .../4.9.4/ld: error: treating warnings as errors
>> collect2: error: ld returned 1 exit status
>
> This is gold linker specific so you should disable these warning when ld-is-gold is in DISTRO_FEATURES. Its a big broad brush so lets
> try to make it small as we can.

I ended applying it before seeing Khem's comment; can you make the
change as he proposes and send a new patch?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

