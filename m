Subject: [meta-java][dunfell][Bug] libecj-bootstrap-native_3.6.2.bb failing in do_compile randomly
To: openembedded-devel@lists.openembedded.org
From: "akash hadke" <akash.hadke@kpit.com>
X-Originating-Location: IN (103.110.167.10)
X-Originating-Platform: Linux Firefox 88
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 28 Jun 2021 01:19:38 -0700
Message-ID: <6PMF.1624868378873525682.DlmA@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="If2vEcFsjMAlMX9HqLIU"

--If2vEcFsjMAlMX9HqLIU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

libecj-bootstrap-native_3.6.2.bb failing in do_compile randomly in my build=
. The failure occurrence is very less.
I am triggering build by removing all sstate cache, multiple times and lie=
cj-bootstrap-native gets fail for 2 times out of 50. The occurrence rate is=
 very less but still, I think we need to check the issue.

Below are some of the failure messages.

Found 1 semantic error compiling "source/org/eclipse/jdt/internal/compiler=
/problem/DefaultProblemFactory.java":
24. public class DefaultProblemFactory implements IProblemFactory {
^-------------^
*** Semantic Error: Type "IProblemFactory" was not found.

*** Semantic Error: Type "org.eclipse.jdt.internal.compiler.AbstractAnnota=
tionProcessorManager" was not found.
61. import org.eclipse.jdt.internal.compiler.ICompilerRequestor;
^----------------^
*** Semantic Error: Type "org.eclipse.jdt.internal.compiler.ICompilerReque=
stor" was not found.

I think some race condition is occurring while compilation. I checked the =
do_compile code, BB_NUMBER_THREAD is getting used for making the compilatio=
n of java files parallel, I think that might be causing the race condition =
but I am not sure. If we remove the use of BB_NUMBER_THREAD then compilatio=
n will get single-threaded but I am not sure if that will be fine. And as t=
he issue is not occurring very often it's hard to say if this will fix the =
issue.

--If2vEcFsjMAlMX9HqLIU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

&nbsp;libecj-bootstrap-native_3.6.2.bb failing in do_compile randomly in my=
 build. The failure occurrence is very less.<br />I am triggering build by =
removing all sstate cache, multiple times and liecj-bootstrap-native gets f=
ail for 2 times out of 50. The occurrence rate is very less but still, I th=
ink we need to check the issue.<br /><br />Below are some of the failure me=
ssages.<br /><br /><em>Found 1 semantic error compiling "source/org/eclipse=
/jdt/internal/compiler/problem/DefaultProblemFactory.java":</em><br /><em>&=
nbsp;&nbsp;&nbsp; 24. public class DefaultProblemFactory implements IProble=
mFactory {</em><br /><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^-------------^</em><br /><em>*=
** Semantic Error: Type "IProblemFactory" was not found.</em><br /><br /><b=
r /><em>*** Semantic Error: Type "org.eclipse.jdt.internal.compiler.Abstrac=
tAnnotationProcessorManager" was not found.</em><br /><em>&nbsp;&nbsp;&nbsp=
; 61. import org.eclipse.jdt.internal.compiler.ICompilerRequestor;</em><br =
/><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^----=
------------^</em><br /><em>*** Semantic Error: Type "org.eclipse.jdt.inter=
nal.compiler.ICompilerRequestor" was not found.</em><br /><br /><br />I thi=
nk some race condition is occurring while compilation. I checked the do_com=
pile code, BB_NUMBER_THREAD is getting used for making the compilation of j=
ava files parallel, I think that might be causing the race condition but I =
am not sure. If we remove the use of BB_NUMBER_THREAD then compilation will=
 get single-threaded but I am not sure if that will be fine. And as the iss=
ue is not occurring very often it's hard to say if this will fix the issue.

--If2vEcFsjMAlMX9HqLIU--
