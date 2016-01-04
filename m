Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id D306673177
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 13:09:48 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id to4so242623857igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 05:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:cc:to:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=LY/Kylib+klpfbkHV5buYH8HyOCJUlLj5QSwP92dYU0=;
	b=tpI/VFM7jUGYI1HnVBE9j/7A92IUXoLs+xgzTxPibN3kDrkwGGjEUblq9GG3udNq0t
	fddRuEJSBeSrkDdbckO6+Lg+6x/jCY0OIodrKTlFIjbs+Gp0DvgYK26YbVY5zwqPBGKP
	/q+dOWlpxWEdK8HhW+q1K79x0fbcvTmozNUXb2iZqXRvxz3q3E+bOedGpmR9PmvyN6hV
	SFqhBLzKM9hO7tQJ7y02aLMVo0IliO6mIE81VvChVGC2FVD2nS8bqJzKI8s5X7y4RXF1
	PBgEAfu+0GW4p0UZYiL5JI5C4jAL+/bTqk5OM4AQqrhQhR6OAE7aSedSucMvUtTR1Q0z
	AqBw==
X-Received: by 10.50.61.234 with SMTP id t10mr70641303igr.20.1451912989604;
	Mon, 04 Jan 2016 05:09:49 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	v42sm11183488iov.16.2016.01.04.05.09.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jan 2016 05:09:48 -0800 (PST)
References: <1451677511-7346-1-git-send-email-twoerner@gmail.com>
	<1451677511-7346-5-git-send-email-twoerner@gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568A6F16.5030200@gmail.com>
Date: Mon, 4 Jan 2016 08:09:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1451677511-7346-5-git-send-email-twoerner@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser][RFC PATCH v1 4/4] chromium: upgrade 40.0.2214.91 to 49.0.2607.0
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
X-List-Received-Date: Mon, 04 Jan 2016 13:09:51 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Carlos,

I need to understand the intent of the patch
"0001-Remove-accelerated-Canvas-support-from-blacklist.patch" you
created for chromium-40. Back then the json block you wanted to remove
for your builds was:

     {  
      "id": 24,
      "description": "Accelerated 2d canvas is unstable in Linux at the
moment",
      "os": {
        "type": "linux"
      },
      "features": [
        "accelerated_2d_canvas"
      ]
    },


In chromium-49 that block looks like:

    {   
      "id": 24,
      "description": "Accelerated 2d canvas is unstable in Linux at the
moment",
      "os": {
        "type": "linux"
      },  
      "exceptions": [
        {
          "gl_vendor": "Vivante Corporation",
          "gl_renderer": "Vivante GC1000"
        }
      ],  
      "features": [
        "accelerated_2d_canvas"
      ]   
    },


Since you do a lot of work with Freescale, Freescale (mostly?) has
Vivante, and the latest code has an exception for Vivante specifically,
are you (or anyone) still interested in carrying this patch forward?

Best regards,
    Trevor

