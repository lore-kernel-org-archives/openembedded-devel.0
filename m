Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OOXJg-0000JP-9N
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 16:40:42 +0200
Received: by iwn5 with SMTP id 5so1778873iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jun 2010 07:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=aV5cFQzUt2/kHRX7/JvRqSiUMxcPgna7MV9rM16t/zE=;
	b=vITQXv7a0BbEyOtjrmpuMB6c8fJz6CpkXjZzwBXuzKQv4AvIgE/cIzYUdK5z//SecU
	PEoKRUKVcFb/2PgTezZILZddH8XPmmgwgnwCEWtiTj6hoZJI6sJSfPiXIWlfq6Ic5Zjn
	n1w38Is8zn2AdY4mJYQmSFoHXAuf8nK5N8LEg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=MKl0gOKCUhjQWTpuCNNRfDCD/0FZxgIdY2PVGB0MZwEL2n2c42YVpHXy3vRNxHvrFF
	azSYMG/HFZJNDmzBdWHBsrkHHd3TNM2LTAw0FOsQfnpq7zkfKqKqNIGzdiFl3XCCB3TQ
	4Jzon2zw3LG7FBGphrDRH+kaMbfGXv9+dKx2E=
Received: by 10.231.187.29 with SMTP id cu29mr7673151ibb.70.1276612573254; 
	Tue, 15 Jun 2010 07:36:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Tue, 15 Jun 2010 07:35:53 -0700 (PDT)
In-Reply-To: <AANLkTikBqtzPB0rBp1DQ4Ekzo40HeAJcX1q7i1mLFaWy@mail.gmail.com>
References: <AANLkTilQUwinqS2HGJJzP3t_UTmXtH9daLEiN_fek-6i@mail.gmail.com> 
	<AANLkTikBqtzPB0rBp1DQ4Ekzo40HeAJcX1q7i1mLFaWy@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Jun 2010 07:35:53 -0700
Message-ID: <AANLkTim1FUHwT6lBvu2yoUUM8rvYRSaw-9e4VE_olNoa@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: angstrom-distro-users <angstrom-distro-users@linuxtogo.org>
Subject: Re: OSError: [Errno 2] No such file or directory
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
X-List-Received-Date: Tue, 15 Jun 2010 14:40:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2010 at 7:12 AM, nikunj badjatya
<nikunjbadjatya@gmail.com> wrote:
> =A0File "/home/nikunj/ope/bitbake/lib/bb/build.py", line 141, in
> exec_func_python
> =A0 =A0utils.better_exec(comp, g, tmp, bbfile)
> =A0File "/home/nikunj/ope/bitbake/lib/bb/utils.py", line 185, in better_e=
xec
> =A0 =A0exec code in context
> =A0File "relocatable_binaries_preprocess", line 4, in <module>
> =A0File "relocatable_binaries_preprocess", line 2, in
> relocatable_binaries_preprocess
> =A0File "<bb>", line 7, in rpath_replace
> =A0File "<bb>", line 35, in process_dir
> =A0File "/opt/python2.6/lib/python2.6/subprocess.py", line 633, in __init=
__
> =A0 =A0errread, errwrite)
> =A0File "/opt/python2.6/lib/python2.6/subprocess.py", line 1139, in
> _execute_child
> =A0 =A0raise child_exception
> OSError: [Errno 2] No such file or directory
> ERROR: Task 100 (/home/nikunj/ope/openembedded/recipes/coreutils/
> coreutils-native_8.5.bb, do_populate_sysroot) failed
> NOTE: Tasks Summary: Attempted 20 tasks of which 0 didn't need to be reru=
n
> and 1 failed.
> ERROR: '/home/nikunj/ope/openembedded/recipes/coreutils/
> coreutils-native_8.5.bb' failed
>

It dies in process_dir while trying to do os.access I think. my guess
is that you are
passing it host paths like /usr/lib /lib etc which are under root
permissions and can
not be modified by normal user.

You have to debug it. uncomment the

#bb.note("Testing %s for relocatability" % fpath)

in classes/relocatable.bbclass line 28

and check what paths are passed to it when you do

bitbake -b coreutils-native_8.5.bb

-Khem


