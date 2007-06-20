Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <arkaitzj@gmail.com>) id 1I12nL-0001rd-9j
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2007 18:12:35 +0200
Received: by an-out-0708.google.com with SMTP id b33so40660ana
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2007 09:08:49 -0700 (PDT)
Received: by 10.100.125.5 with SMTP id x5mr514579anc.1182355728972;
	Wed, 20 Jun 2007 09:08:48 -0700 (PDT)
Received: by 10.100.153.5 with HTTP; Wed, 20 Jun 2007 09:08:48 -0700 (PDT)
Message-ID: <7ceeaed30706200908x55776d44jeba0944dbdf274b0@mail.gmail.com>
Date: Wed, 20 Jun 2007 18:08:48 +0200
From: Arkaitz <arkaitzj@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Distro or machine vars that can modify FILESPATH?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2007 16:12:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I am compiling ucslugc and uclibc configuration fails due to a filepath error.
It gets before the uClibc.machine from files/uClibc.machine  than from
uClibc-0.9.29/ixp4xxbe/uClibc.machine unless i set FILESPATH variable
in uclibc bb file to get before from
${FILE_DIRNAME}/uclibc-${UCLIBC_BASE}/${MACHINE_ARCH}.

The strange thing is that for koen works well building angstrom
distro, so i suppose that it must be something relative to config
vars.
Is there a way to see how bitbake chooses files from different paths and why?

Thanks
-- 
Arkaitz


