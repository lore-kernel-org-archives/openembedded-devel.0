Received: from mail-yw0-f175.google.com ([209.85.211.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1OL8Wr-0007UG-CG
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 07:36:13 +0200
Received: by ywh5 with SMTP id 5so2222307ywh.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jun 2010 22:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=snYk4q0wZY8Oa60BXSHhg/MjNErMS39Lt3bBlmq47G0=;
	b=wU0NUCwCDH26enn8YJV6W7cNtGMhsQAra1uiptcXaJa7BdDLpo5n11f4qmdZikn1oA
	UEOKseGoa2eylSC/cLAbhRGoGN9BGnFfDy2Zq4it8zXsLoTQR5dmSkosKjE4yHz8uO+d
	D0cLkd3vNFPKxPD6oSlWGEd5o0qi9MlcjL3j0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=JhTdlEhPNCK9jlzTNA2n9Z4JlnYd/dimd+hvLThBuTE39tJJVkeaB1zUoCQ43XYT2X
	t1XvHzKkVA7KUi7O862BcIayB06Pu2lYCzas8LKm8SoPZgkNFmSCpb/Tnh8WprfuVlmc
	4l4Moke3m+vDJElxkdEKUMphLzKHCzecbOsUw=
Received: by 10.91.97.2 with SMTP id z2mr6122207agl.102.1275802314113; Sat, 05 
	Jun 2010 22:31:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.94.16 with HTTP; Sat, 5 Jun 2010 22:31:34 -0700 (PDT)
In-Reply-To: <CC3AC527-3026-4188-8BF1-F6AEC47A7A6C@mac.com>
References: <F7B59210-EE40-4F5D-AE84-3C2040426D89@mac.com> 
	<AANLkTimdoOiHxXo3XU-3tLC2v9o90k8V0omWcjX_8n5w@mail.gmail.com> 
	<CC3AC527-3026-4188-8BF1-F6AEC47A7A6C@mac.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Sat, 5 Jun 2010 22:31:34 -0700
Message-ID: <AANLkTin1Wa5buxLDTg3w1ZAu609NRR_vCXf3DydPfF8j@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.175
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: autologin recipe for gumstix Overo
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
X-List-Received-Date: Sun, 06 Jun 2010 05:36:14 -0000
Content-Type: text/plain; charset=UTF-8

Hi Elvis,

Does the image do the autologin the second time you boot it?

I wrote the autologin stuff to do some factory testing of new boards
but discovered after some head scratching that the image only did the
automatic login after the first reboot; I wondered if perhaps the
postinst stuff was only getting run after the image was booted.

For the testing stuff, I ended up just booting once and then cloning
this once-booted test image.

-Ash


