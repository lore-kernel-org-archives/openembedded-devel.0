Received: from mail-gh0-f178.google.com ([209.85.160.178]
	helo=mail-gy0-f178.google.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SRLMA-0004mZ-LK
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 12:39:54 +0200
Received: by ghbf1 with SMTP id f1so4237416ghb.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Yua2i8Xui1wdboiYDrmhBsDh5Fj5K5sBBkfMRGjHIgk=;
	b=H8Uu2jLdkbk9xFkhtSVPm/5S8wfmRLVBG/lszYmzm+aKuMlAYuoOTPcBck4LetNshX
	BnHkgNk5vYPO/SglVeuDPM3EKamMqcUp0aJ1TNa0CWDUJS5UYBpC4F9qjQPErOQCjqxM
	UqerAQcMXtHxPqF9ECbJQz3Piw999qvjDvOT3v4axOVX7Ikd3Nbut454pbBWqK212X78
	Zw176dqblmIhbrandXsCAIoXyxl3CpW6shi6rUMThOyLLjLyGoj3MsnwXFazz08VSQMR
	q5e1J3pplHHDGi+Ibhb2rK06m8SlMRhotp+q/QmIltUTWtj0oVVy0ljhm12z0yzgfCXh
	tZLQ==
MIME-Version: 1.0
Received: by 10.50.190.197 with SMTP id gs5mr8024487igc.37.1336386604035; Mon,
	07 May 2012 03:30:04 -0700 (PDT)
Received: by 10.231.49.134 with HTTP; Mon, 7 May 2012 03:30:04 -0700 (PDT)
Date: Mon, 7 May 2012 12:30:04 +0200
Message-ID: <CAOHjBZusy84GNLJ+YXY598E4Zd5M-zAZo=hb==wVJhwTQqDPkA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [oe-core] Prefix in rpms packages
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
X-List-Received-Date: Mon, 07 May 2012 10:39:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

after having built my own image, I've looked at the resultant rpms under
the deploy directory and I saw
no relocation is possible (rpm -qpli <package>). This because Prefix is not
set during spec file creation
(package_rpm.bbclass).
As far as you know, is it possible to set Prefix somehow?

Please let me know.
Thanks,
Giuseppe

