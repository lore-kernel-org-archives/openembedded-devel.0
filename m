Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 64BA86A441
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 04:28:05 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so3614530eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 21:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=P3hleC+xaAY4chne71o+k4Acv1GRQaohd+/Tb1JbQWI=;
	b=iAhP9JhSR+SQCjvr9G24jolvmV/wu1hshKMpw7NkQU+wFUvjw+iMhdNzG7Ep8xjKzA
	q1SFEhNz4EzcMxuA3xA2bNVylZW44XHxNUB2yI6DouJ+LvXOEDBOQ/pspoS/MOdCaoYz
	m3t//uUUK8Gn9AEoN4c4D3M0jJnSfMANMuwPtz8sVGi4PYgujWVX8oZ3Kjo6Ae0Jvznh
	/kJHcN99dnt7G+szNZuteZ+jSq9ufD7b/mxO9gODiD9dnPeQyAQwYfRfkjkG8jh/fk62
	s3yeuqV6nj9frz9IhRFYWNqOCG3tc3qjZcea7iDCN6Z4YGu2/rHScc7mtLauF29/e6ZQ
	i0UA==
X-Gm-Message-State: ALoCoQlzbKUwYHLTomtv6sODbdtZ04JJ1uj8CzkEDEShIQ1T7JOZyM3VToRw5BaQzDov8prJ7kb+
MIME-Version: 1.0
X-Received: by 10.14.199.3 with SMTP id w3mr55084467een.33.1381206486144; Mon,
	07 Oct 2013 21:28:06 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Mon, 7 Oct 2013 21:28:06 -0700 (PDT)
In-Reply-To: <20131007175336.GB18775@denix.org>
References: <CALmOhgkzmnVuviF+cAzELRpdZomHDzpHn5-1dZEwa_xznG8JiQ@mail.gmail.com>
	<20131004141433.GG6240@jama>
	<CALmOhgnnSusbb0OPO32TN9C8xQRmqMmW+ZDoEq7d2870JoQfRw@mail.gmail.com>
	<20131004173934.GL6240@jama> <20131007175336.GB18775@denix.org>
Date: Tue, 8 Oct 2013 00:28:06 -0400
Message-ID: <CALmOhgmujUDrb512ffgHZ1+Ep8ZLPsamBOdfnA8rKvrXB3r2+A@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Abhijit Potnis <abhijit_potnis@mentor.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: meta-qt5, master, qtwebkit-examples build failure
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
X-List-Received-Date: Tue, 08 Oct 2013 04:28:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 7 October 2013 13:53, Denys Dmytriyenko <denis@denix.org> wrote:
> FYI, besides the obvious ICU requirement, qtwebkit-examples was not actually
> building any examples for me, so I had to bbappend the recipe w/ a tiny patch:
>
> http://arago-project.org/pipermail/meta-arago/2013-October/002107.html


:-)

I had noticed that issue as well. Any chance this could get merged upstream?

It's a bit unfortunate you need to add "qtwebkit-examples-examples" to
your IMAGE in order to actually get the examples into your image,
instead of just "qtwebkit-examples".

