Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1KiA5g-0003Aj-9D
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Sep 2008 17:46:16 +0200
Received: by fg-out-1718.google.com with SMTP id l26so1882001fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2008 08:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=x16u5AcLPIQIR2dk3rFp8t4Nug3IGUMr0l9cvFqLWVU=;
	b=u/vA1jrDCtRPVw/Svy9jFBmyzqpXclEWwDRQoZJt29u5sVWhkXzzrYLwkAKthVpOIV
	j32/6T+tyz2bTxQlQ/F5uXslVOFoxlJGseE7LWwTUHHFTseNVW84P7hCmBKdQGOO5Lrd
	9WqzXnhBVAIVrNpYgg4yDKprm8dLjA9E2PzjU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=CJPW330O5FT1MQgx4jH/CSMW8OA1A7wG5o1089LWIaGZxyjoZstr2AYnhJ28/UmOlu
	lFxeMXDrFVI2YSWY0rel8q7vYBy4lQeBq7QNrr4nfpDZaCwT850sZQvNl45dy3f6CkUc
	5ntPNqLNG1xnhcYQQBMzHIMul0AaKI5B5DMXc=
Received: by 10.187.246.10 with SMTP id y10mr770902far.58.1222184563212;
	Tue, 23 Sep 2008 08:42:43 -0700 (PDT)
Received: by 10.187.224.10 with HTTP; Tue, 23 Sep 2008 08:42:43 -0700 (PDT)
Message-ID: <d1b08f940809230842j78a43e64r6f2e43fcecd1f656@mail.gmail.com>
Date: Tue, 23 Sep 2008 17:42:43 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gbaj23$rup$1@ger.gmane.org>
MIME-Version: 1.0
References: <d1b08f940809230158s78f04a4bq866bf586dce5cafe@mail.gmail.com>
	<gbaj23$rup$1@ger.gmane.org>
Subject: Re: QA Logs now on tinderbox
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
X-List-Received-Date: Tue, 23 Sep 2008 15:46:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>These two are the most common:

Well, it is clear to me these are 'cruft' in staging. Two wrong
packages are tainting the whole staging area.
(This phenomenon has been already seen with libmudflap, libc, ... in
angstrom-stable [1])

But...why not fix these two immediately?

Andrea


[1]
ERROR: QA Issue: libmudflap.la failed sanity test (installed) in path
/OE/angstrom-tmp//staging/arm-angstrom-linux-gnueabi/lib
NOTE: a QA error occured but will not be logged because QA_LOG is not set
ERROR: QA Issue: libsupc++.la failed sanity test (installed) in path
/OE/angstrom-tmp//staging/arm-angstrom-linux-gnueabi/lib
NOTE: a QA error occured but will not be logged because QA_LOG is not set
ERROR: QA Issue: libmudflapth.la failed sanity test (installed) in path
/OE/angstrom-tmp//staging/arm-angstrom-linux-gnueabi/lib
NOTE: a QA error occured but will not be logged because QA_LOG is not set
ERROR: QA Issue: libstdc++.la failed sanity test (installed) in path
/OE/angstrom-tmp//staging/arm-angstrom-linux-gnueabi/lib
NOTE: a QA error occured but will not be logged because QA_LOG is not set


