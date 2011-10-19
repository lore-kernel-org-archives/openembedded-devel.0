Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RGRkm-0001XN-Ta
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 10:44:01 +0200
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Wed, 19 Oct 2011 10:37:57 +0200
Date: Wed, 19 Oct 2011 10:38:11 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20111019083811.GA4790@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4E9D3640.9070608@telia.com> <4E9D8EC0.4030409@gmail.com>
	<4E9E87AF.70900@telia.com>
MIME-Version: 1.0
In-Reply-To: <4E9E87AF.70900@telia.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: Use of stamps in the source directory of openembedded-core
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
X-List-Received-Date: Wed, 19 Oct 2011 08:44:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Ulf Samuelsson <ulf_samuelsson@telia.com> [111019 10:19]:
> 2011-10-18 16:35, Khem Raj skrev:
> > On 10/18/2011 1:18 AM, Ulf Samuelsson wrote:
> >> After I have built openembedded-core, I notice that the source directory
> >> is loaded with files: *.done.

> > they indicate successful download of a source tar.

> Are you sure?
> It does not look like the whole story to me.

> I can see that for each source file, there is a *.done file,
> but there are also a lot of *.done which seems to be related
> to patches, and the patches are not present in the source directory.

I can confirm what Ulf is seeing.
E.g. doing:
$ ls ../downloads/parallel*
../downloads/parallel_build_fix_1.patch.done
../downloads/parallel_build_fix_5.patch.done
../downloads/parallel_build_fix_2.patch.done
../downloads/parallel_build_fix_6.patch.done
../downloads/parallel_build_fix_3.patch.done
../downloads/parallel-make-fix.patch.done
../downloads/parallel_build_fix_4.patch.done

(../downloads is the source directory in our configuration).

There seems to be a number of files which only have *.done-file, but not
any downloaded file.

> Why are those files created?

> What happens if two different packages have a patch with the same name?

Good questions...

> >> Is this really a good idea?

> >> I tend to use a common source directory for multiple projects.

> >> Having stamps in the source directory, means that you let one
> >> project affect the others.

-- 
Anders Darander
ChargeStorm AB / eStorm AB


