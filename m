Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0337E77166
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 13:49:15 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id q188so27432208oia.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2016 06:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=S4fv0RuQ+p+E4FTodwlE8dmbraLN+YUV+THBeL+/zRg=;
	b=kQAqpUvkvGEUeKEBL0uXefb11TU06IIuU+9fts4syh0NLRJoVzdng4noq5oFqFjKAW
	o+pi3/l4IVaCNdQLK3fewZ4oCw2zae3V5YZVw2EFW7l6Pwr/1VJnunXYiXuB5W5f9vaq
	fNsdUjcG3bYpyh9NWTu8l/mvSaAudrxH3J+MrSdEttYWknD+pw6hd+nxzS7Acj/T6v+J
	EAz/lco1D2roh3RC50WlGk8/o5ES+JEQl+ZSlaj74W3THkhslu7IX4/M1CQNGTUqorX0
	sjaKY11l0lZUReYzvsPWWkTz4f12/QIsYhCHV9QwLYVco3o6xBD4L+zHkzITF3/GKujw
	jW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=S4fv0RuQ+p+E4FTodwlE8dmbraLN+YUV+THBeL+/zRg=;
	b=a5iJUe8TWPhWWSdMAD5qdAaV13E+cGMlwG6Kqoyc46NfTJvEKtKzUV6iVQJiOhjBBm
	RRcYbRoq9AosSAL3bZnNo0tsMHBYz6i7yC8aHSWg5boNeW7r9MOpO0hZY03ZJmY/wUEp
	SrYjYd48GnC/4sanUfeSafUuTbznGqnh5BXjvy3UI7emn5ICcUVIGkG1rsa7O1fxsNak
	+1R9GZu2JfYZhKqSdWZs7UzInt3FOZNZy/RlQjr6aQ3PTmq3a5iK2ESyHqEulQJNqlT+
	/6q5gNhd+EcPSkfq+vRzfqqsSL/PHUCiNOfbQePsAVCk/h/0d2JklmYY+iU5vHfJIct9
	w/Ew==
X-Gm-Message-State: AE9vXwOhZpTjIfsxlP3A4RC062rVKuvN6yS/0rMYQgy7EU2dpSYe69Ybh8B30J5xhcikxP6e
X-Received: by 10.202.62.130 with SMTP id l124mr5797444oia.97.1473428956013;
	Fri, 09 Sep 2016 06:49:16 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E8E2.dip0.t-ipconnect.de. [93.232.232.226])
	by smtp.gmail.com with ESMTPSA id
	b133sm1399890iti.21.2016.09.09.06.49.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Sep 2016 06:49:14 -0700 (PDT)
Message-ID: <1473428952.20354.2.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 09 Sep 2016 15:49:12 +0200
In-Reply-To: <CAPybu_1eaFHPHJTksdQZFqt3SGJmPKKrHsZYFPkYkRuybnu8yw@mail.gmail.com>
References: <1467977051.1401.9.camel@intel.com>
	<CAPybu_1eaFHPHJTksdQZFqt3SGJmPKKrHsZYFPkYkRuybnu8yw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Henning Heinold <heinold@inf.fu-berlin.de>
Subject: Re: [meta-java] icedtea7-native - IOException constructor compile error
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
X-List-Received-Date: Fri, 09 Sep 2016 13:49:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-09-09 at 15:10 +0200, Ricardo Ribalda Delgado wrote:
> I am struggling with te same issue. Did you manage to fix it on your side?

It hasn't happened again. So no, I haven't fixed anything, it just works
now. No-one was able to explain how the actual bootstrapping works, i.e.
which IOException.java is meant to be used when compiling openjdk-boot.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




