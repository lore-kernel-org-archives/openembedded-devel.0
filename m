Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 689A56B109
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 16:50:16 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so1897603eaj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 09:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=K3bZxiEQ4CYc2y/NmdT/p66ulK8OXk+BEN7LdQz6bE0=;
	b=d8mcLfi+v29pQomqZp8sfT/6cUcBInU48r1/H/ozNGX9C2fzfd4oUL01DrhrPU4e3k
	1in7HCc+6xFkLnZPdNmzA1wturi+st6zrXHzMox2vTz+VYzFjejtRWx83WP1tk66mQXh
	fwVAj87LYBgroWw9GygcCmXukJJp64TlZt5X4RBKNl/It0kdpFn0Hvq+fWJhwP7a9mtJ
	svmEPGr8Q+XrspjzpGUyXdZUQ6EmvJjr3ePG4Lv1k8eKiFVWuKJQvaLQyHsWgbFZvpnn
	F7McpIDbIyVPqvycocWHP1H33HoQX0wo20y0F3M4miRJn5VaWSlE80zJZV7PojnmV9mv
	/gjQ==
X-Gm-Message-State: ALoCoQncX3MMv0xXdJHk4yxTtTYyBBrXfqVWHqxIFyAzWSrhzayT7XQqoIFAf+SdZHrWWvbtqRnR
MIME-Version: 1.0
X-Received: by 10.14.174.131 with SMTP id x3mr4355301eel.61.1380905417890;
	Fri, 04 Oct 2013 09:50:17 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Fri, 4 Oct 2013 09:50:17 -0700 (PDT)
In-Reply-To: <20131004141433.GG6240@jama>
References: <CALmOhgkzmnVuviF+cAzELRpdZomHDzpHn5-1dZEwa_xznG8JiQ@mail.gmail.com>
	<20131004141433.GG6240@jama>
Date: Fri, 4 Oct 2013 12:50:17 -0400
Message-ID: <CALmOhgnnSusbb0OPO32TN9C8xQRmqMmW+ZDoEq7d2870JoQfRw@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 04 Oct 2013 16:50:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks Martin,

On 4 October 2013 10:14, Martin Jansa <martin.jansa@gmail.com> wrote:
> Just lucky guess, do you have ICU enabled in qtbase?

That was a good guess!

It appears there's very important rule to know when using meta-qt5's
master branch (i.e. 5.1.0):
- if all you need is qtbase then ICU is not required and therefore not
enabled (to save space)
- if you need anything on top of qtbase then ICU must be enabled in
qtbase's configuration

Do you think this would be a good thing to include in this layer's
README (or is it somewhere I should have looked)?

