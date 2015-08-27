Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id EB6E576D72
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:30:43 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so16569898igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=dvAq4JTKUUV0nT4cD+0IEJTFRkukciAJrOBDtzEVO5Y=;
	b=CtVJ3FIgQNXC7yGQCUSgO0l59oOJlpU+fWvzy3pN5JNQwDE9Ef2qFkfVhP/0ETr1l0
	owJzsGV7BOhttwLyu0H9LSx380CjOqh06pRimc8Xi/nl3M5O3ZebGfXnq/UdCQOm+jta
	LDG42p3fQA+CVI+9wh6MLnT4SQCVcWNQvvsna9URw18E0jye8Fs92SuMGUIzPZZ7ZuHF
	oNTkC/FfC0NQnt0qdw+9ZDgiXxA0poBNvoV90DFjyQ36yw6zd5Od+3LbB0CIAoS8H1Nm
	Mkhe1GUAb1xRg4fnRKD8Kn3aL9qdQDO3+5CJWuGHg/ST41Vwrqc3vRTMMWlTIBce2Dj+
	6leA==
X-Received: by 10.50.30.196 with SMTP id u4mr10154770igh.11.1440682243201;
	Thu, 27 Aug 2015 06:30:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.135 with HTTP; Thu, 27 Aug 2015 06:30:13 -0700 (PDT)
In-Reply-To: <CAP9ODKoUaLm8yUiS1idtr+Neyth_oBufdME1XSJGdR2S7XbdzA@mail.gmail.com>
References: <1440633769-19691-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKoUaLm8yUiS1idtr+Neyth_oBufdME1XSJGdR2S7XbdzA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Aug 2015 06:30:13 -0700
Message-ID: <CAMKF1srdDoCk8_bbLVEYjWgUEF_MyfY5KcRor2QoLiN7FJoJ4g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] layer.conf: define LAYERDEPENDS
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
X-List-Received-Date: Thu, 27 Aug 2015 13:30:45 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 27, 2015 at 5:46 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Wed, Aug 26, 2015 at 9:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> qtwebkit needs ruby-native which comes from meta-ruby
>> this patch adds initial set of layer dependencies there may be more
>> that can be added but its a start
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> This is only when someone uses QtWebkit; a lot of people does not use
> it so it is not a real dependency.
>

then it should be part of BBMASK which is default so if someone wants
it then user gets a clear message and knows what to fix

> We could make it dependent on the collection availability?

yes that could be how do u propose to do so

