Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SLB1k-0007Rc-G4
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 12:25:20 +0200
Received: by wgbdr12 with SMTP id dr12so7929735wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=kXjBzSTkvRUX1YJVtJphEEOPwgX2CGKIxmt5aeFhD3s=;
	b=uqTGFQ3XGS+wkzBu6mQbAS9okAkttFjQBiLQIZ8XE9iUkk8L3cJFmc2oD6xb9FirbS
	vkq3AjfGKE1LRKeVPZAc/Yy5ExgAqMv53xVwV/m64I8Ej7mcmohXpEF6RuptTT7KSUkU
	wI4M7pE4QNjH7Gd1vvLz+GI4HVsucpHqcrsQglqbS16pFQcHmuw6yXN+Bd/T2A6ZeY8E
	AYz2pUPS0CMJpEHpjYTW1Gl9nSUWJLdDifGUHsEMoSsp/cHvEeWpbsMkqaGcqXCx6cG1
	d5D073MejwnOJmNCtikYRAV7kPKvOa/1MNX/xCz4H+6TOJZo0JZ7vJScvFbRcCRcGL2X
	zVyw==
MIME-Version: 1.0
Received: by 10.180.105.69 with SMTP id gk5mr7666325wib.3.1334916950985; Fri,
	20 Apr 2012 03:15:50 -0700 (PDT)
Received: by 10.223.14.149 with HTTP; Fri, 20 Apr 2012 03:15:50 -0700 (PDT)
Date: Fri, 20 Apr 2012 12:15:50 +0200
Message-ID: <CAGiJk9eeDabHUuKAnHZtWw_ChX7jVEDvsN+LEpsZomvH_Ky94w@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Some packages don't get deployed to the staging directory?
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
X-List-Received-Date: Fri, 20 Apr 2012 10:25:20 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
my observation shows that e.g. libphonon.so from the package
libqtphonon4-dev will not get installed to the staging sysroot.

Is this intended or a bug?


The same happened with other non -dev packages like
meta-kde/recipes-base/kde-runtime_git.bb.
The package kde-runtime-declarative-scriptengine will get installed
but it's content is missing in the staging sysroot (not an issue but
still confusing).

I'm currently fixing race conditions in meta-kde and set strict
explicit behavior on search paths for libraries (not searching
native/hosts directories for libs).
kdelibs4 obviously fails over this with "libphonon.so no rule to make
target", but that goes too much into the details.

-- 
Regards
Samuel


