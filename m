Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vadmium@gmail.com>) id 1RKUzP-00033d-KO
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 13:59:51 +0100
Received: by faas16 with SMTP id s16so5382130faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2011 05:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0TuAr60nMONVmLSSQ97radqBlcV0yWx+eJENNFJ8mII=;
	b=UDcJt+qrhR5LKmfthLWa9ju2TuHYExmRc+vf1uHuD3dJ4KHcxffJvunOekIyRuwTwb
	tH/L9LTTopN0k4DxFLVeB+2LkF3Z1pQ9HqsRmbyxDbxHIrb39yIDuVPsy5YxGMVDNnpS
	p5i+NC+PdBRJ1ooAUYmPh9xSRXYXI1zhzS5YI=
MIME-Version: 1.0
Received: by 10.223.15.13 with SMTP id i13mr21332718faa.36.1319979227441; Sun,
	30 Oct 2011 05:53:47 -0700 (PDT)
Sender: vadmium@gmail.com
Received: by 10.152.3.196 with HTTP; Sun, 30 Oct 2011 05:53:47 -0700 (PDT)
In-Reply-To: <1240131A-F61F-49B7-9645-F34056E3ED88@microbee-systems.com>
References: <CALJpqJw17ftFmyYbdBw8VZoEvdF54-tGGBj4QfHqEWKy5BqgGw@mail.gmail.com>
	<20111030103021.GA3822@rhein.zuhause.netz>
	<1240131A-F61F-49B7-9645-F34056E3ED88@microbee-systems.com>
Date: Sun, 30 Oct 2011 12:53:47 +0000
X-Google-Sender-Auth: bJmUUmDimz8nFPeMPdWFVrpaJjg
Message-ID: <CA+eR4cGOJUzp+JdZAzsiZBH=J_MSVy8+Mg48pFEiXcMSq39sQA@mail.gmail.com>
From: Martin Panter <vadmium+floss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Help?
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
X-List-Received-Date: Sun, 30 Oct 2011 12:59:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>> On Sat, Oct 29, 2011 at 04:50:58PM -0500, David Thomas wrote:
>>>  File "/home/dthomas/bitbake/lib/bb/cooker.py", line 529, in
>>> parseConfigurationFiles
>>>    bb.event.fire(bb.event.ConfigParsed(), self.configuration.data)
>>> IOError: [Errno 1] Operation not permitted

=E2=80=9COperation not permitted=E2=80=9D is EPERM, which is different from=
 EACCESS
=E2=80=9CPermission denied=E2=80=9D. Normally you get the permission denied=
 issue for
file permission issues, and =E2=80=9Cnot permitted=E2=80=9D for trying to d=
o something
like killing a root process as a normal user.

Have you tried using strace on bitbake? See if you can find if there's
an actual system call returning EPERM just before Python raises the
IOError exception.

-Marty


