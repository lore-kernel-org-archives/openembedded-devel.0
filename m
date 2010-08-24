Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Onue6-0006SI-0E
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 16:38:55 +0200
Received: by ewy7 with SMTP id 7so3384366ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=mAvqdZh1llQA0QiRoq2Hmgvx5e1164/FK4CgxqwxQGs=;
	b=BsyF0+uO8mY8G4TZV5vsVDvWMxzIqLF5WbxOWqhp2zVnHerIx9UGVPTmncJcNaCGdX
	84XjGJm2MBn9cGAlUlV9YRsVdhzXKe8ZHu7+xLKYiMvt3OaSv/sdweprxU4k4mQjEgCZ
	F1LtZsVxP2s3NX8fn4NjQphe7Gp8r/PADpGMk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=G4cr8coG2rTu0dnss+/DQj9PpynZVCvjX5dl6HJgAYoRiqX5eBybsfbxCrpYg1gJC9
	3HrNOVp+Jc8qGCbyhUCStiAa8dvH3zQIH0FnDNDPPc1MUy1lmancbXHzxaKb+/ZdH6vU
	04Iz1EC8RnDDVxRIaY0kJI1UwMPJ2mrpMYqXg=
Received: by 10.216.86.15 with SMTP id v15mr6107250wee.9.1282660691423; Tue,
	24 Aug 2010 07:38:11 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Tue, 24 Aug 2010 07:37:51 -0700 (PDT)
In-Reply-To: <4C73D124.9080501@balister.org>
References: <4C73D124.9080501@balister.org>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 24 Aug 2010 07:37:51 -0700
X-Google-Sender-Auth: rZDo8cjnA9QcOpqKGU1HtZ-gpds
Message-ID: <AANLkTim2em_n1V354oi5=5rqC2b7R+eb4P+QXHf17ao1@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Has the file:// behavior changed in SRC_URI
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
X-List-Received-Date: Tue, 24 Aug 2010 14:38:56 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 24, 2010 at 7:03 AM, Philip Balister <philip@balister.org>wrote:

> I know I used to be able to use a local directory with kernel source like
> this:
>
> SRC_URI = "file:///home/balister/kernel_source"
>
> but now all that is copied to ${WORK} is an empty directory. This is with
> bitbake 1.10.0.
>
> Any thoughts?


Should work, if it doesn't its a bug in the metadata.  Are you using
relatively recent OE, or a split off tree?  There was a fix that went into
OE for do_unpack to obey either the 'path' *or* 'host' url components for
file: uris, because which it goes in was changed in bitbake.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

