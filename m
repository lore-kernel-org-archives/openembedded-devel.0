Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 59ED37038D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 21:51:03 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f73so211915yha.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 14:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=0FRYcHynG2oIVriQMSI7vo/t+OuoPpSfLeYcwdhMdF4=;
	b=kZhuRlV+vcaFk7+SmvHNiRZD3pp/huHXw2u72+MNLLuGspSwHULNjZWVH7eCAIcto3
	ykDCYwGjsGSa/6STSwNLzW4NU3vj/mMl4IkaUuE6+cQCfeUTq12SCj/0lKdqWHGUjApL
	m/42Gn9GkgNa4ICZ75zcaKIwy0lc0bg35rZPCxpOax2xZHW8w6Jfk4IVIsvBnc5HM1CH
	4Gj73h+Z3eqBDEbLtkyc9OGpwZWypaAjewsqZS+4IKUA/5mjSplylcxCwg8zXMGTHIZo
	5tCYzKwdbSpTOOgEytDaMU1nNUhPXHa+Y1CstwZEt0tyEvMMyzWHzaoXBi2ShxBCt9qd
	S7iw==
MIME-Version: 1.0
X-Received: by 10.236.31.135 with SMTP id m7mr7080716yha.104.1406670665004;
	Tue, 29 Jul 2014 14:51:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Tue, 29 Jul 2014 14:51:04 -0700 (PDT)
In-Reply-To: <CAMKF1sqknbM=rXZCRLjPtcHG_1-D1wV+XtBDtao2kOTG9F81+g@mail.gmail.com>
References: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
	<CAMKF1sqknbM=rXZCRLjPtcHG_1-D1wV+XtBDtao2kOTG9F81+g@mail.gmail.com>
Date: Tue, 29 Jul 2014 18:51:04 -0300
X-Google-Sender-Auth: iKwsv3wNs7GB50J7L-pglVsyU2g
Message-ID: <CAP9ODKq=mNeFOf_DMTNiiT4Lj0H=zujFyad97=E1K+KGTrr5OQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 1/2] chromium: Add PACKAGECONFIG for disabling API keys info bar
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
X-List-Received-Date: Tue, 29 Jul 2014 21:51:14 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 5:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jul 29, 2014 at 3:22 AM, Carlos Rafael Giani
> <dv@pseudoterminal.org> wrote:
>> +Upstream-Status: Inappropriate [other]
>> +The info bar is not a bug; it is just undesirable in some use cases.
>> +A clean approach - which requires discussion with upstream - is to
>> +disable it by using a command line option.
>> +
>> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>
> I think it would be better to get a suggested solution which is
> acceptable upstream.

There are customers who don't need to use the Google APIs so they are
not willing to make an API key and instead they prefer to drop the
warning and keep using the Chromium as an application platform. We've
been involved in a couple of projects lately where this happened.

Chromium's upstream advice is to generate an API and use it to deploy;
I think in the meta-browser's case this is sub-optimal as we'll end
having several products and customers using our key and not making
their own ones.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

