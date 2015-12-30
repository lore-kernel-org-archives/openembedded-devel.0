Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id CEDA76FFEF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 22:03:33 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id mv3so152652167igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=+bDJXdjc4xoT3TbjuA5pLlosK1+cy9P26PtBhImipvw=;
	b=U21ktXCOd4NunBs1THyGPQ37TD6ScwvcPye1xQ7P7x91uUtB4g8facfeNMGyulkoet
	sML6E33wmGQI2TOEIbXuJ/nYWkskJTuUrvYTevxJ+ESoswB5GB+dmDV84DVX3TxeJKhB
	R6iJmyCGWYaUa6kLBI3tXjhbho8lS8jRVV+301CfZJP2/GT04vafzUMXvU1JjFFwRMoL
	aEsbub38c92qoY+ARohhpPcUJQoO9xQD6i3jxbtwtPWWBE60P6xDbG2takS2tLqA5f+w
	WbyStWzXfPID4qWY3TRIzJmqS7L5Tc1UaET9ZHJI9GDMd8ILJG8+XHGimDhylbuN7klp
	lWXg==
X-Received: by 10.50.155.43 with SMTP id vt11mr36765051igb.6.1451513014416;
	Wed, 30 Dec 2015 14:03:34 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	o80sm7816616ioe.15.2015.12.30.14.03.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 14:03:33 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1451506017-6206-1-git-send-email-twoerner@gmail.com>
	<D7088E06-64E6-48CF-B84B-4E47815CFA38@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568454B1.4080803@gmail.com>
Date: Wed, 30 Dec 2015 17:03:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <D7088E06-64E6-48CF-B84B-4E47815CFA38@gmail.com>
Subject: Re: [meta-oe][PATCH v2] nodejs: update from 4.2.3 to 4.2.4
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
X-List-Received-Date: Wed, 30 Dec 2015 22:03:36 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 12/30/15 15:48, Khem Raj wrote:
>> On Dec 30, 2015, at 12:06 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>>
>> Additionally, the LICENSE file changed: Updated node LICENSE file with new npm
>> license:
>>
>> - npm's license changed from being copyrighted "Isaac Z. Schlueter" to "npm,
>>  Inc. and Contributors"; more text was added clarifying the copyrights to
>>  things such as the npm logo, the typeface, and trademarks
> Does this mean we need to alter packaging of these files ?
> are there any commercial implications ?

I'm not a lawyer so I can't say for certain and, to be honest, I don't
spend much time understanding all the licensing issues revolving around
Free/OpenSource Software, but both before and after this change the
licensing of npm itself was and is Artistic License 2.0.

before:

-    Copyright (c) Isaac Z. Schlueter
-    All rights reserved.
-    npm is released under the Artistic 2.0 License.
-    The text of the License follows:

after:

+    The npm application
+    Copyright (c) npm, Inc. and Contributors
+    Licensed on the terms of The Artistic License 2.0
... and then it goes on to mention that npm packages are licensed by
their creators, npm isn't responsible for them or their contents, and
specifies the ownership of various trademarks, logos, and the licensing
of the typeface used on their website.

So my best guess is that nothing has changed other than a legal entity
was created "npm, Inc." to oversee npm instead of one person being
personally responsible. But, like I said, I'm no expert in these things.

