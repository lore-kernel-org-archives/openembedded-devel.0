Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Picpk-0005lC-92
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 02:09:04 +0100
Received: by wyb40 with SMTP id 40so2646403wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 17:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=kQSLTJuTCn4XGWpWmhNp7C61t+lB8zIJDVtIg/ZIqTo=;
	b=ZVd2bRMngkwxHGhQ9Jd/QXskMA4j64AYK0GjOEw6KMlyea4kt2u3MFlvW+fXDPL44h
	0ZtEHXj4QgSgt9Os7XbZXgDX9HbwAdgwqps2i4q8lS/sqK7CsdMloPZGtmkX2FFeN9+l
	g4DjK0dAHIcYehw/lfaGUD1dcDbRZrAR3AkQs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=WgJjnAdHaUvba8HD393hQl0KcH9+IxLI+1C/0pBJKYXl7jJAUEOf26hYPcpQuUtAy4
	1IZ4deQhunKYvqTnEk8F9zpkwUA8v/dTOJ3JhZH4JtYcJkMgSyuV5rVoUri7TIBqzGv0
	CsCz1cwhrBMGVs4ozgd5Tmji93bsfob4nZgsE=
Received: by 10.216.3.3 with SMTP id 3mr7186244weg.57.1296176894824; Thu, 27
	Jan 2011 17:08:14 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.254.91 with HTTP; Thu, 27 Jan 2011 17:07:54 -0800 (PST)
In-Reply-To: <4D41FD22.2050803@atmel.com>
References: <4D4092E8.8040207@atmel.com> <ihqdm4$jaj$1@dough.gmane.org>
	<4D41FD22.2050803@atmel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 27 Jan 2011 18:07:54 -0700
X-Google-Sender-Auth: An3LGfP-oms1LPNiSJWa9eE-tV8
Message-ID: <AANLkTi=icqQU7h3zp0rHXOrKF81FDXMdh_YerW6yWbgD@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Patching from a file containing a compressed directory (<directory>.tar.bz2)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jan 2011 01:09:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 27, 2011 at 4:17 PM, Ulf Samuelsson
<ulf.samuelsson@atmel.com> wrote:
> To me, maintaining this is much less work than maintaining a
> SRC_URI statement.
>
> Obviously, it would be better if the build system
> had a defined order when applying patches from a file
> containing multiple patches.

You seem to be under the mistaken impression that it's the build
system that's handling that.  It just calls quilt/patch to apply it..
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


