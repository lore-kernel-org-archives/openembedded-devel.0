Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SLBk5-00012p-6f for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 13:11:09 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SLBau-0003jg-Ay for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 13:01:40 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 13:01:40 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 13:01:40 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 Apr 2012 13:01:33 +0200
Message-ID: <jmrfmb$s29$1@dough.gmane.org>
References: <CAGiJk9eeDabHUuKAnHZtWw_ChX7jVEDvsN+LEpsZomvH_Ky94w@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <CAGiJk9eeDabHUuKAnHZtWw_ChX7jVEDvsN+LEpsZomvH_Ky94w@mail.gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: Some packages don't get deployed to the staging directory?
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
X-List-Received-Date: Fri, 20 Apr 2012 11:11:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-04-12 12:15, Samuel Stirtzel schreef:
> Hi, my observation shows that e.g. libphonon.so from the package 
> libqtphonon4-dev will not get installed to the staging sysroot.
> 
> Is this intended or a bug?
> 
> 
> The same happened with other non -dev packages like 
> meta-kde/recipes-base/kde-runtime_git.bb. The package
> kde-runtime-declarative-scriptengine will get installed but it's content
> is missing in the staging sysroot (not an issue but still confusing).
> 
> I'm currently fixing race conditions in meta-kde and set strict explicit
> behavior on search paths for libraries (not searching native/hosts
> directories for libs). kdelibs4 obviously fails over this with
> "libphonon.so no rule to make target", but that goes too much into the
> details.

AIUI OE uses a whitelist to stage directories (correct me if I'm wrong), so
not everything ends up in sysroots. I have a similar problem with files in
/lib/firmware that I'd like to have end up in sysroots.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPkUIMAAoJEHZqAkdh1vT6fNkP/3bsgWzl9Bp94pjwmoQsjkho
+HPKhVk7wcwBBTCO4mj7McmSNEGWOPPhbIdgBZuTNtiy9UVbcdIY0kZHoWhPT5u+
LlXpvAShlXXyhmQMj3HBrGfxgGUAICSZUZbkv1GOR8CLdQMRcbvu2NxMqGVpV+/9
Z7SuKu1grFk9Zc0akbwqSs1O193YTw0AX8fH/re/k4WGwD/gZJxPlnmmXhhNDj+W
N7HD2eqBUngf08motz2cOwgzOOAHuBjDeuW38pZa9N/3cy+bMr7H6Z8JDcDOqs0Z
nWRIlfXn9aR5M74ii8QpCf8sBhocK4fvF/u2wpUSMdsBNrFkeJXCwvbH+uNN8b98
llf50m1ySkMwvmpnwbqtkJXYUfFu4v7kAQO4bideW1To1+Il/1tw3Bi2b/HFmQZN
+7goTsx/R9yW4kDAfxAT3mRLI7VkIYruO7A/zlrOzxbEYUcePsVzi1FGdLrVbqRM
J/GXKjQ6QepmseHCLQenTrNM6/APyV4fyi+yAoDfwrUncXkcEa4jg1I9URZh7tqT
yPsXMOMzoj5xjM5VY8kt1ip3SeOSE0Pg4Ls6c+jkXhnVRUk40vZDZ+THqcF10Wlx
j5c4xcugy5wJnu2jSxNXzRmNdpCIo/N6YuHauhqnbgqd/wv1oaIdDu69tci6eF2m
iFwZ2hoR+QgOdETE3Lmy
=Mmwh
-----END PGP SIGNATURE-----



