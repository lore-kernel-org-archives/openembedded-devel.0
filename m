Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 23C2E73CB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 01:42:41 +0000 (UTC)
Received: by ierf6 with SMTP id f6so4677852ier.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 18:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=uijqZrtHA1LRrKCM4kQbkwu7PJWLdpQFt2LI5b3mvm8=;
	b=gYGzLx3+Tyx7XkpqD4vs+4GU3fh9IF5f7nC/XFdL9brWmrT28Jem0jYdqkb0NeGcnM
	LRxc3XQrqB0ARjPQc5xe9+wxgbiuCajVGXaSXiOmxuSq26sM7Hlp8yWVoSz8KBrsdUmE
	53jN5if6y2TEjK9Vn+RBt7Qg+yFveOb+mT2drBIheS8oj3nvx70pneld2bnWN6DVx+3b
	1FWsfwMxMiWbojX3OR5nS+2ykW/0UlhaSVCucMJUCVX7WZpc/DrFKFrfUHYfPQA6HKr+
	NhoWHSSV/n5XTtP+3CWPakDwBhm2gKnvCd1dcrFeVNkcrfONbvasMqIGXpHCYkizYEo4
	5qcQ==
MIME-Version: 1.0
X-Received: by 10.43.93.135 with SMTP id bu7mr11351380icc.1.1427766163024;
	Mon, 30 Mar 2015 18:42:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Mon, 30 Mar 2015 18:42:42 -0700 (PDT)
In-Reply-To: <3AB4D6A9-5462-4A7D-8C7F-0E7FDE38DD18@gmail.com>
References: <1427742371-19160-1-git-send-email-hugo.saldanha@aker.com.br>
	<20150330202507.GA22676@mail.itconsulting-heinold.de>
	<CAP9ODKoLZAv_ae7vJQ1vL_UPTX_mS9t__42Uac7Nf-6ivnNvHg@mail.gmail.com>
	<3AB4D6A9-5462-4A7D-8C7F-0E7FDE38DD18@gmail.com>
Date: Mon, 30 Mar 2015 22:42:42 -0300
X-Google-Sender-Auth: AEPI8_WJRRNJ9AoB8at1Rx3oPXQ
Message-ID: <CAP9ODKrzSGThUHqiV3dCYxbXJk_m-VeCwpVm54c2f2Zu3vmtAQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] cacao: fix problem with internal garbage collector
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
X-List-Received-Date: Tue, 31 Mar 2015 01:42:42 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 30, 2015 at 10:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mar 30, 2015, at 5:45 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>
>> On Mon, Mar 30, 2015 at 5:25 PM, Henning Heinold
>> <henning@itconsulting-heinold.de> wrote:
>>> if I remember correctly, than the bdwgc inside cacao differs from upstream.
>>
>
> there must be a reason why cacao decided to fork its own copy. Do we know ?

I don't. We could compare the versions and see if it has any change.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

