Return-Path: <eu@felipetonello.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1042C60E7C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 20:13:58 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id va2so1013945obc.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 12:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=NbJzmBUY6kb2c0BtPm6+aIw5dlSULbhZRAOTK4MlxxM=;
	b=FDK5GMUufxHEAy0Ca4d8r1LKyY2vMbLRt46WWt5P3BnchDSp4RrJ7ig2yS6xvfPH6w
	5a3OWDIwcqnd2UL3/tUkfcjfs9jQwElIY+xZ/iNmq9FmuUecojr5lkQDnruml8BXzhPZ
	P/biT+FanK4BV/n7MZDyNHDE4GDuNRuTJ17vWZjE5Q9Wxoqih3nHNOiX/LY5ujC0VnbP
	tMsA/Bcx0SXMqk0fz5LQgr4/UJeJyqh0TVEV8zWZlg/yfQoFthOEXfLQsz6ZpWgf/xFS
	y8D5K+hA0PF17mT1OwNvt7+RBT0wAIvNfmLMWr96LQaUncM13iXvb9EKCLWAVtlFMvx2
	0wVQ==
X-Gm-Message-State: ALoCoQm6hvg5Vha5A152NrjliBkthjVP9JuEdKJEiwEdsgKHf+kH847xpsVEY+PDOJUcYaCZ/pJG
X-Received: by 10.182.48.130 with SMTP id l2mr3099645obn.44.1390421639980;
	Wed, 22 Jan 2014 12:13:59 -0800 (PST)
Received: from localhost.localdomain (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id qh4sm15736277obc.4.2014.01.22.12.13.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 12:13:58 -0800 (PST)
Message-ID: <52E02685.6060003@felipetonello.com>
Date: Wed, 22 Jan 2014 12:13:57 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1387232705-18081-1-git-send-email-eu@felipetonello.com>	<52E00310.4000808@felipetonello.com>
	<20140122180208.GW4100@jama>
In-Reply-To: <20140122180208.GW4100@jama>
Subject: Re: [PATCH v2] packagekit: Updated to 0.8.13
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
X-List-Received-Date: Wed, 22 Jan 2014 20:13:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin

On 01/22/2014 10:02 AM, Martin Jansa wrote:
> On Wed, Jan 22, 2014 at 09:42:40AM -0800, Felipe Ferreri Tonello wrote:
>> On 12/16/2013 02:25 PM, Felipe F. Tonello wrote:
>>> From: "Felipe F. Tonello" <eu@felipetonello.com>
>>>
>>> Packagekit will compile support for all backend supported by OE-core. Images
>>> that want to install packagekit should specify its correct backend dependency
>>> as well.
>>>
>>> Ex.: install the following packages to an image that uses rpm:
>>>    * packagekit
>>>    * packagekit-backend-smart
>>>
>>> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
>>> ---
>>>    ...deprecated-glib-functions-and-use-the-new.patch | 166 --------
>>>    .../packagekit/packagekit-0.5.6/configurefix.patch |  13 -
>>>    .../packagekit/packagekit-0.5.6/opkgfixes.patch    | 422 ---------------------
>>>    .../packagekit/packagekit_0.5.6.bb                 |  62 ---
>>>    .../packagekit/packagekit_0.8.13.bb                |  64 ++++
>>>    5 files changed, 64 insertions(+), 663 deletions(-)
>>>    delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch
>>>    delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configurefix.patch
>>>    delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.patch
>>>    delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
>>>    create mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.8.13.bb
>>>
>>
>
> Looks good to me, I'm just waiting for Koen's ACK as he had some
> comments before.
>

It seems that is crashing because of python-apt.

I will have to check this later.

Felipe

