Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <piero.pezzin@gmail.com>) id 1LhK7y-0005EX-Bx
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 09:49:27 +0100
Received: by fg-out-1718.google.com with SMTP id 13so1310559fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2009 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=MpO3lSmAbIyFgf5fNBaL5rK39SopiKxvNaBmfPEi20A=;
	b=o4hnUVQy0ne2qDYDpJIwL8q1bLdun+55yey0Z1CtYpF0Sdy4iMCjkmLxH+Y+/+fKtx
	bN3+vtKWxOtyZKGv/Vgg3TuFrVwJNF4F26sqJlNYBiD8usmiHUNwDX6uljypoE4QiBZ8
	BCc6eBVEf36ORP4MZ2BujlSkIQGULf53c/kEM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KewkmBlHQTnkA4rvCbg7QOHxvTQ8K+2PJCPYpB5g623jtYppPa55z+e+L51DIw9+ke
	jqGRZKG+Pox00WFjC2wL5TaflI/qKy2VVBhLicTFjBnxlNqJJjKR89T/U6ncATlyG2EM
	UbpgRMHIWrQugMcPNHBohVo8rzR2UqteItLXc=
MIME-Version: 1.0
Received: by 10.86.33.10 with SMTP id g10mr5777113fgg.47.1236761361184; Wed, 
	11 Mar 2009 01:49:21 -0700 (PDT)
In-Reply-To: <19c1b8a90903101122r59d22d0fia19158c42583e784@mail.gmail.com>
References: <49bdfd00903100733s3af6dc2o48f09b48593fe51f@mail.gmail.com>
	<19c1b8a90903101122r59d22d0fia19158c42583e784@mail.gmail.com>
Date: Wed, 11 Mar 2009 09:49:21 +0100
Message-ID: <49bdfd00903110149y39fb7aa4we99d373a4ff1790f@mail.gmail.com>
From: Piero Pezzin <piero.pezzin@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problem building kernel - too many files open
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
X-List-Received-Date: Wed, 11 Mar 2009 08:49:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I searched without success. I agree with you, there is a problem on my host,
but I'd like to know why it pops out during the do_package task.

Any help will be appreciated.

Regards,

Piero

On Tue, Mar 10, 2009 at 7:22 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Mar 10, 2009 at 7:33 AM, Piero Pezzin <piero.pezzin@gmail.com>
> wrote:
> > Hello everyone,
> >
> > I'm building a minimal distribution for a x86 machine (my host is a
> x86-64
> > with CentOS 4.4):
> >
> > OE Build Configuration:
> > BB_VERSION        = "1.8.12"
> > METADATA_BRANCH   = "org.openembedded.dev"
> > METADATA_REVISION = "a8a23e995d108ecdfc31129941671551c591bc6e"
> > TARGET_ARCH       = "i486"
> > TARGET_OS         = "linux"
> > MACHINE           = "x86"
> > DISTRO            = "minimal"
> > DISTRO_VERSION    = ".dev-snapshot-20090310"
> > TARGET_FPU        = ""
> >
> >
> > During kernel building, I got the following error:
> >
> > OTE: package linux-2.6.28: started
> > NOTE: package linux-2.6.28-r6: task do_package: started
> > ERROR: Error in executing:
> > /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> > linux_2.6.28.bb
> > ERROR: Exception:exceptions.IOError Message:[Errno 24] Too many open
> files:
> >
> '/home/piero/work/qong-nobk/openembedded/build/tmp/work/x86-oe-linux/linux-2.6.28-r6/tmpQbp1Jr'
> > ERROR: Error in executing:
> > /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> > linux_2.6.28.bb
> > ERROR: Exception:exceptions.ImportError Message:No module named traceback
> > ERROR: Error in executing:
> > /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> > linux_2.6.28.bb
> > ERROR: Exception:exceptions.ImportError Message:No module named traceback
> > ERROR: Error in executing:
> > /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> > linux_2.6.28.bb
> > ERROR: Exception:exceptions.ImportError Message:No module named traceback
> > ERROR: Build of
> > /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> > linux_2.6.28.bb do_package failed
> > Traceback (most recent call last):
> >  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/bin/bitbake", line
> 143,
> > in ?
> >  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/bin/bitbake", line
> 140,
> > in main
> >  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/cooker.py",
> line
> > 612, in cook
> >  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/cooker.py",
> line
> > 514, in buildFile
> >  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/runqueue.py",
> > line 842, in execute_runqueue
> >  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/runqueue.py",
> > line 951, in execute_runqueue_internal
> >  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/cooker.py",
> line
> > 137, in tryBuild
> >  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/cooker.py",
> line
> > 111, in tryBuildPackage
> >  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/build.py",
> line
> > 278, in exec_task
> >  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/build.py",
> line
> > 113, in exec_func
> >  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/build.py",
> line
> > 136, in exec_func_python
> >  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/utils.py",
> line
> > 186, in better_exec
> > ImportError: No module named traceback
> > ERROR: Task 12
> > (/home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
> > linux_2.6.28.bb, do_package) failed
> >
> > Does anyone know what's happening?
>
> Someone else also saw this problem. Search the archives. Its most
> probably your host.
>
> >
> > Thanks in advance and best regards.
> >
> > Piero
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

