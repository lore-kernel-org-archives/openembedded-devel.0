Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QQEJ0-0003Zv-PI for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 09:51:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QQEG3-0008M6-0B for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 09:48:27 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2011 09:48:26 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2011 09:48:26 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 28 May 2011 09:48:10 +0200
Message-ID: <irq9bq$p5p$1@dough.gmane.org>
References: <1306554475-24292-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1306554475-24292-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][pull-request] gcc-4.6: Update with patches from gcc-4_6-branch and linaro 2011.05 release
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
X-List-Received-Date: Sat, 28 May 2011 07:51:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thanks, applied

On 28-05-11 05:47, raj.khem@gmail.com wrote:
> Hi Koen,
> 
> The following changes since commit 5210f866332b4b16fbb4df4e26797bf47d37f1a3:
> 
>   connman: add gnutls to depends and move iptables dependency also to .inc file (2011-05-27 20:28:39 +0200)
> 
> are available in the git repository at:
>   git://git.openembedded.org/meta-openembedded-contrib kraj/gcc-4.6-updates
> 
> Khem Raj (1):
>       gcc-4.6: Update with patches from gcc-4_6-branch and linaro 2011.05 release
> 
>  meta-oe/recipes-devtools/gcc/gcc-4.6.inc           |    2 +-
>  .../0002-Backport-from-mainline.patch              |    2 +-
>  .../0003-Backport-from-mainline.patch              |    2 +-
>  .../0004-Backport-from-mainline.patch              |    2 +-
>  .../0005-Backport-from-mainline.patch              |    2 +-
>  .../0006-Backport-from-mainline.patch              |    2 +-
>  .../0007-Backport-from-mainline.patch              |    2 +-
>  ...26-Paolo-Carlini-paolo.carlini-oracle.com.patch |    2 +-
>  .../0009-Backport-from-mainline.patch              |    2 +-
>  ...-27-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    2 +-
>  ...-03-28-Richard-Guenther-rguenther-suse.de.patch |    2 +-
>  .../gcc-4_6-branch-backports/0015-gcc.patch        |    2 +-
>  .../0016-Backport-from-mainline.patch              |    2 +-
>  .../0017-libgfortran.patch                         |    2 +-
>  ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |    2 +-
>  ...-rx-rx.h-LABEL_ALIGN_AFTER_BARRIER-Define.patch |    2 +-
>  .../0021-c.opt-Add-std-c-03.patch                  |    2 +-
>  .../gcc-4_6-branch-backports/0022-PR-c-47570.patch |    2 +-
>  .../gcc-4_6-branch-backports/0023-PR-c-47504.patch |    2 +-
>  ...ild_noexcept_spec-Call-cxx_constant_value.patch |    2 +-
>  .../gcc-4_6-branch-backports/0025-c-family.patch   |    2 +-
>  ...026-decl2.c-cp_check_const_attributes-New.patch |    2 +-
>  .../gcc-4_6-branch-backports/0027-Core-1148.patch  |    2 +-
>  .../gcc-4_6-branch-backports/0028-PR-c-48313.patch |    2 +-
>  .../gcc-4_6-branch-backports/0029-PR-c-47999.patch |    2 +-
>  ...non_dependent_expr-Keep-dereferences-outs.patch |    2 +-
>  ...rence_binding-Allow-direct-binding-to-an-.patch |    2 +-
>  .../gcc-4_6-branch-backports/0032-Core-1232.patch  |    2 +-
>  ...-is_valid_constexpr_fn-Specify-input-loca.patch |    2 +-
>  .../gcc-4_6-branch-backports/0034-PR-c-48296.patch |    2 +-
>  .../gcc-4_6-branch-backports/0035-PR-c-48166.patch |    2 +-
>  ...a-alpha.c-alpha_sr_alias_set-Don-t-define.patch |    2 +-
>  .../gcc-4_6-branch-backports/0038-PR-c-48319.patch |    2 +-
>  .../0039-PR-preprocessor-48248.patch               |    2 +-
>  .../0040-PR-debug-48253.patch                      |    2 +-
>  .../gcc-4_6-branch-backports/0042-PR-c-48265.patch |    2 +-
>  .../0043-Fix-a-typo-in-FLOAT_SSE_REGS.patch        |    2 +-
>  .../gcc-4_6-branch-backports/0044-PR-c-48281.patch |    2 +-
>  .../gcc-4_6-branch-backports/0045-PR-c-48369.patch |    2 +-
>  .../gcc-4_6-branch-backports/0046-PR-c-48212.patch |    2 +-
>  ...-03-31-Richard-Guenther-rguenther-suse.de.patch |    2 +-
>  .../0049-PR-target-48142.patch                     |    2 +-
>  .../0050-PR-target-16292.patch                     |    2 +-
>  .../gcc-4_6-branch-backports/0051-PR-c-48280.patch |    2 +-
>  ...07-from-trunk-to-the-4.6-release-branch-t.patch |    2 +-
>  .../0054-Backport-from-mainline.patch              |    2 +-
>  ...fig-spu-t-spu-elf-dp-bit.c-Use-instead-of.patch |    2 +-
>  ...11-04-02-Jonathan-Wakely-redi-gcc.gnu.org.patch |    2 +-
>  ...-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch |    2 +-
>  ...-da.po-de.po-el.po-es.po-fi.po-fr.po-id.p.patch |    2 +-
>  ...n.dg-bessel_6.f90-Use-dg-add-options-ieee.patch |    2 +-
>  ...4-2011-04-04-Janus-Weil-janus-gcc.gnu.org.patch |    2 +-
>  .../0065-es.po-Update.patch                        |    2 +-
>  ...ers-for-functions-from-the-frexp-family-w.patch |    2 +-
>  ...-04-05-Richard-Guenther-rguenther-suse.de.patch |    2 +-
>  ....c-self_referential_size-Fix-2010-07-13-c.patch |    2 +-
>  .../0070-de.po-Update.patch                        |    2 +-
>  ...ov-io.c-Use-GCC-Runtime-Library-Exception.patch |    2 +-
>  .../0073-Backported-from-mainline.patch            |    2 +-
>  .../0074-PR-debug-48466.patch                      |    2 +-
>  ...73-from-trunk-to-the-4.6-release-branch-t.patch |    2 +-
>  .../0077-Backport-from-mainline.patch              |    2 +-
>  .../0078-de.po-Update.patch                        |    2 +-
>  .../0079-PR-debug-48343.patch                      |    2 +-
>  .../0080-PR-fortran-48117.patch                    |    2 +-
>  ...-config-i386-sse.md-Update-copyright-year.patch |    2 +-
>  ...ure-stackalign-non-local-goto-5.c-Fix-for.patch |    2 +-
>  .../0084-PR-tree-optimization-48377.patch          |    2 +-
>  .../0085-de.po-Update.patch                        |    2 +-
>  .../gcc-4_6-branch-backports/0086-PR-c-48450.patch |    2 +-
>  ....c-finish_decltype_type-Add-complain-parm.patch |    2 +-
>  .../gcc-4_6-branch-backports/0088-PR-c-48452.patch |    2 +-
>  .../gcc-4_6-branch-backports/0089-PR-c-48468.patch |    2 +-
>  .../gcc-4_6-branch-backports/0090-PR-c-48500.patch |    2 +-
>  ...1-04-08-Steven-G.-Kargl-kargl-gcc.gnu.org.patch |    2 +-
>  .../0092-PR-testsuite-48506.patch                  |    2 +-
>  ...ther-than-crashing-in-array_type_nelts-if.patch |    2 +-
>  .../gcc-4_6-branch-backports/0095-PR-c-48528.patch |    2 +-
>  ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    2 +-
>  ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    2 +-
>  ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    2 +-
>  .../0101-Backport-from-mainline.patch              |    2 +-
>  ...2-common.opt-Tbss-Tdata-Ttext-New-options.patch |    2 +-
>  .../gcc-4_6-branch-backports/0104-PR-c-48523.patch |    2 +-
>  .../gcc-4_6-branch-backports/0105-PR-c-48534.patch |    2 +-
>  .../gcc-4_6-branch-backports/0106-PR-c-48517.patch |    2 +-
>  ...011-04-12-Allan-McRae-allan-archlinux.org.patch |    2 +-
>  ...-v850.c-expand_prologue-Do-not-use-the-CA.patch |    2 +-
>  .../0109-PR-rtl-optimization-48549.patch           |    2 +-
>  ...-2011-04-12-Martin-Jambor-mjambor-suse.cz.patch |    2 +-
>  .../0112-Fix-PR-target-48090.patch                 |    2 +-
>  .../0113-Fix-PR-c-48574.patch                      |    2 +-
>  .../gcc-4_6-branch-backports/0114-PR-c-48570.patch |    2 +-
>  .../0115-PR-middle-end-48591.patch                 |    2 +-
>  ...-2011-04-13-Paul-Thomas-pault-gcc.gnu.org.patch |    2 +-
>  .../gcc-4_6-branch-backports/0117-PR-c-48594.patch |    2 +-
>  .../0118-sv.po-Update.patch                        |    2 +-
>  .../0119-Backport-from-mainline.patch              |    2 +-
>  .../0122-PR-target-48605.patch                     |    2 +-
>  .../0123-PR-target-48614.patch                     |    2 +-
>  ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |    2 +-
>  ...04-15-Takaya-Saito-gintensubaru-gmail.com.patch |    2 +-
>  ...15-Paolo-Carlini-paolo.carlini-oracle.com.patch |    2 +-
>  ...ibjava.jni-jni.exp-gcj_jni_get_cxxflags_i.patch |    2 +-
>  ...Daniel-Krugler-daniel.kruegler-googlemail.patch |    2 +-
>  ...Daniel-Krugler-daniel.kruegler-googlemail.patch |    2 +-
>  .../0132-PR-lto-48538.patch                        |    2 +-
>  ...c-freebsd.h-CPP_CPU64_DEFAULT_SPEC-Replac.patch |    2 +-
>  ...Daniel-Krugler-daniel.kruegler-googlemail.patch |    2 +-
>  .../0135-doc-passes.texi-Fill-crossref-nodes.patch |    2 +-
>  ...ce-Make-lang.in-gnatbind-Replace-ALL_CFLA.patch |    2 +-
>  .../0138-PR-tree-optimization-48616.patch          |    2 +-
>  ...-04-18-Richard-Guenther-rguenther-suse.de.patch |    2 +-
>  ...x-weakref-trickery-breakage-on-alpha-dec-.patch |    2 +-
>  ...-is_redundant_typedef-Add-inline-to-proto.patch |    2 +-
>  .../gcc-4_6-branch-backports/0142-PR-c-48632.patch |    2 +-
>  .../0143-PR-middle-end-48661.patch                 |    2 +-
>  .../gcc-4_6-branch-backports/0144-PR-c-48537.patch |    2 +-
>  .../0146-PR-testsuite-48675.patch                  |    2 +-
>  ...-04-18-Richard-Guenther-rguenther-suse.de.patch |    2 +-
>  .../0149-PR-target-48678.patch                     |    2 +-
>  .../gcc-4_6-branch-backports/0151-PR-c-46304.patch |    2 +-
>  ...tstrap-lto.mk-Remove-obsolete-requirement.patch |    2 +-
>  ...-04-20-Richard-Guenther-rguenther-suse.de.patch |    2 +-
>  .../0154-Backport-from-mainline.patch              |    2 +-
>  .../0155-PR-tree-optimization-48611.patch          |    2 +-
>  .../gcc-4_6-branch-backports/0156-PR-c-48657.patch |    2 +-
>  .../0157-PR-target-48288.patch                     |    2 +-
>  .../gcc-4_6-branch-backports/0159-PR-c-48594.patch |    2 +-
>  ...-finish_compound_literal-Don-t-put-an-arr.patch |    2 +-
>  ...lk_gimple_op-GIMPLE_CALL-Fix-couple-of-ov.patch |    2 +-
>  ...-04-21-Richard-Guenther-rguenther-suse.de.patch |    2 +-
>  .../0163-de.po-Update.patch                        |    2 +-
>  .../0164-PR-target-48708.patch                     |    2 +-
>  .../gcc-4_6-branch-backports/0166-PR-c-48716.patch |    2 +-
>  .../0167-PR-target-48723.patch                     |    2 +-
>  .../0168-PR-tree-optimization-48717.patch          |    2 +-
>  .../gcc-4_6-branch-backports/0170-Revert.patch     |    2 +-
>  .../gcc-4_6-branch-backports/0171-PR-c-48685.patch |    2 +-
>  ...616.c-dg-options-Add-fno-common-to-option.patch |    2 +-
>  ...-23-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    2 +-
>  .../0174-PR-preprocessor-48740.patch               |    2 +-
>  ...24-Paolo-Carlini-paolo.carlini-oracle.com.patch |    2 +-
>  .../gcc-4_6-branch-backports/0178-PR-c-48707.patch |    2 +-
>  ...-2011-04-26-Tobias-Burnus-burnus-net-b.de.patch |    2 +-
>  ...-04-26-Richard-Guenther-rguenther-suse.de.patch |    2 +-
>  .../0182-PR-tree-optimization-48734.patch          |    2 +-
>  .../0183-PR-debug-48768.patch                      |    2 +-
>  .../0184-de.po-Update.patch                        |    2 +-
>  .../gcc-4_6-branch-backports/0185-PR-c-48726.patch |    2 +-
>  .../gcc-4_6-branch-backports/0187-PR-c-42687.patch |    2 +-
>  .../gcc-4_6-branch-backports/0188-PR-c-48742.patch |    2 +-
>  ...gcc.dg-20020312-2.c-Add-definition-for-RX.patch |    2 +-
>  .../gcc-4_6-branch-backports/0190-PR-c-48046.patch |    2 +-
>  .../0192-PR-middle-end-48597.patch                 |    2 +-
>  ...-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch |    2 +-
>  ...-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch |    2 +-
>  .../0195-Fix-PR-c-48656.patch                      |    2 +-
>  .../0196-Backport-4.7-patchtes-to-4.6.patch        |    2 +-
>  ...-2011-04-29-Tobias-Burnus-burnus-net-b.de.patch |    2 +-
>  ...29-Paolo-Carlini-paolo.carlini-oracle.com.patch |    2 +-
>  .../0201-PR-tree-optimization-48809.patch          |  199 +
>  ...-2011-04-30-Paul-Thomas-pault-gcc.gnu.org.patch |  198 +
>  ...04-30-Jerry-DeLisle-jvdelisle-gcc.gnu.org.patch |  108 +
>  ...-2011-04-30-Doug-Kwan-dougkwan-google.com.patch |   38 +
>  .../0207-Backport-from-mainline.patch              |  132 +
>  .../0209-PR-target-48723.patch                     |   26 +
>  ...-05-03-Richard-Guenther-rguenther-suse.de.patch |   45 +
>  .../0211-PR-target-48774.patch                     |   78 +
>  ...03-Paolo-Carlini-paolo.carlini-oracle.com.patch |  462 ++
>  ...-sso_string_base.h-__sso_string_base-_M_c.patch |  178 +
>  ...-i386.md-movdi_internal_rex64-TYPE_SSEMOV.patch |  244 +
>  ...1-05-04-Steven-G.-Kargl-kargl-gcc.gnu.org.patch |  189 +
>  .../gcc-4_6-branch-backports/0218-PR-c-48749.patch |   59 +
>  .../0219-Backport-from-mainline.patch              |  145 +
>  .../gcc-4_6-branch-backports/0220-gcc.patch        |   55 +
>  .../0221-PR-ada-48844.patch                        |  182 +
>  .../gcc-4_6-branch-backports/0222-PR-c-40975.patch |   55 +
>  ...0223-Add-missing-break-for-OPT_mfpu_-case.patch |   21 +
>  ...-06-Jonathan-Wakely-jwakely.gcc-gmail.com.patch | 5993 ++++++++++++++++++++
>  .../0226-Fix-PR-c-48838.patch                      |  112 +
>  .../0227-PR-fortran-48894.patch                    |  136 +
>  ...Ramana-Radhakrishnan-ramana.radhakrishnan.patch |   28 +
>  ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |   58 +
>  .../0230-PR-target-48900.patch                     |   44 +
>  ...86-i386.md-movdf_internal_nointeger-Apply.patch |   23 +
>  .../gcc-4_6-branch-backports/0232-PR-c-48089.patch |   77 +
>  .../gcc-4_6-branch-backports/0233-PR-c-48446.patch |  183 +
>  .../gcc-4_6-branch-backports/0234-PR-c-48911.patch |   96 +
>  .../gcc-4_6-branch-backports/0235-PR-c-48909.patch |   73 +
>  ...acking.c-find_mem_expr_in_1pdv-Fix-thinko.patch |   49 +
>  .../0240-Fix-PR-c-48574.patch                      |   63 +
>  ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |   26 +
>  ...09-Paolo-Carlini-paolo.carlini-oracle.com.patch |   44 +
>  .../0244-PR-tree-optimization-48611.patch          |   77 +
>  .../0245-Backported-from-mainline.patch            |   73 +
>  ...x.h-JUMP_ALIGN-LABEL_ALIGN-LOOP_ALIGN-Def.patch |   76 +
>  .../gcc-4_6-branch-backports/0247-Fix-typo.patch   |    7 +
>  ...x.c-rx_memory_move_cost-Reduce-the-cost-f.patch |   23 +
>  .../0249-Fix-PRs-48857-48495.patch                 |  216 +
>  .../0251-gcc-cp-ChangeLog.patch                    |   55 +
>  .../0252-PR-debug-48159.patch                      |  198 +
>  ...-2011-05-11-Tobias-Burnus-burnus-net-b.de.patch |  159 +
>  ...non_dependent_expr-Don-t-check-null_ptr_c.patch |   24 +
>  ...onfig-rx-rx.h-HAVE_PRE_DECREMENT-Fix-typo.patch |   59 +
>  .../0257-zh_CN.po-Update.patch                     |   37 +
>  .../0258-PR-debug-48967.patch                      |  134 +
>  ...-05-12-Richard-Guenther-rguenther-suse.de.patch |  100 +
>  .../0260-PR-tree-optimization-48975.patch          |   61 +
>  .../0263-zh_CN.po-Update.patch                     | 5328 +++++++++++++++++
>  ...-i386.md-movxf_internal-Disable-CONST_DOU.patch |  127 +
>  .../0267-PR-preprocessor-48677.patch               |   31 +
>  .../0269-PR-target-48986.patch                     |   40 +
>  ...x.md-Add-peephole-to-remove-redundant-ext.patch |  126 +
>  ...x.c-rx_memory_move_cost-Include-cost-of-r.patch |   28 +
>  .../0273-PR-tree-optimization-49000.patch          |   39 +
>  .../0274-PR-tree-optimization-49000.patch          |   52 +
>  ...-05-18-Richard-Guenther-rguenther-suse.de.patch |  138 +
>  ...-05-18-Richard-Guenther-rguenther-suse.de.patch |  111 +
>  ...-05-18-Richard-Guenther-rguenther-suse.de.patch |   81 +
>  .../0278-PR-tree-optimization-49039.patch          |  217 +
>  .../0279-Properly-handle-256bit-load-cast.patch    |   95 +
>  .../gcc-4_6-branch-backports/0281-PR-c-48869.patch |  460 ++
>  ...2-gcc.c-torture-execute-960321-1.x-Remove.patch |   30 +
>  .../0283-zh_CN.po-Update.patch                     | 1529 +++++
>  .../gcc-4_6-branch-backports/0284-PR-c-49043.patch |   50 +
>  ...-2011-05-19-Uros-Bizjak-ubizjak-gmail.com.patch |   67 +
>  .../0287-PR-tree-optimization-49073.patch          |  121 +
>  ...-05-20-Richard-Guenther-rguenther-suse.de.patch |  117 +
>  .../0289-PR-bootstrap-49086.patch                  |   35 +
>  .../gcc-4_6-branch-backports/0290-PR-c-48873.patch |   45 +
>  .../gcc-4_6-branch-backports/0291-PR-c-48736.patch |   40 +
>  .../gcc-4_6-branch-backports/0292-PR-c-48745.patch |   59 +
>  ...-register_constexpr_fundef-Add-to-hash-ta.patch |   81 +
>  ...-validate_constexpr_fundecl-Check-DECL_TE.patch |   42 +
>  .../gcc-4_6-branch-backports/0295-PR-c-48948.patch |  188 +
>  .../gcc-4_6-branch-backports/0296-DR-1073.patch    |  156 +
>  .../0298-In-gcc-objc.patch                         |   31 +
>  .../gcc-4_6-branch-backports/0299-PR-c-49066.patch |   34 +
>  ...c-sparc.c-eligible_for_return_delay-Do-no.patch |   65 +
>  ...c-sparc.md-setjmp-Handle-PIC-mode-and-use.patch |   56 +
>  .../gcc-4_6-branch-backports/0303-PR-c-48780.patch |   49 +
>  .../gcc-4_6-branch-backports/0304-PR-c-48945.patch |   45 +
>  .../0305-PR-middle-end-49029.patch                 |   52 +
>  .../0306-PR-target-49104.patch                     |   63 +
>  ...07-config.gcc-sparc-elf-Add-sparc-t-crtin.patch |  150 +
>  .../gcc-4_6-branch-backports/0308-PR-c-48647.patch |   97 +
>  ...-22-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |  185 +
>  .../0311-PR-middle-end-48973.patch                 |  101 +
>  .../gcc-4_6-branch-backports/0312-PR-c-49120.patch |   50 +
>  .../0313-PR-debug-49032.patch                      |   90 +
>  .../0314-PR-lto-49123.patch                        |   49 +
>  .../0316-Always-add-mno-XXX-for-march-native.patch |   98 +
>  .../0317-PR-target-49133.patch                     |   93 +
>  ...c-sparc.c-sparc_option_override-If-not-se.patch |   27 +
>  .../gcc-4_6-branch-backports/0320-PR-c-48617.patch |   37 +
>  .../gcc-4_6-branch-backports/0321-PR-c-47544.patch |   57 +
>  .../gcc-4_6-branch-backports/0322-PR-c-47336.patch |   53 +
>  .../gcc-4_6-branch-backports/0323-PR-c-47263.patch |   45 +
>  .../gcc-4_6-branch-backports/0324-PR-c-49105.patch |   75 +
>  .../gcc-4_6-branch-backports/0325-PR-c-48884.patch |   86 +
>  .../gcc-4_6-branch-backports/0326-PR-c-49042.patch |   63 +
>  .../gcc-4_6-branch-backports/0327-PR-c-49136.patch |  142 +
>  .../gcc-4_6-branch-backports/0328-In-libobjc.patch |   81 +
>  ...24-Paolo-Carlini-paolo.carlini-oracle.com.patch |   62 +
>  .../0330-PR-tree-optimization-44897.patch          |   24 +
>  .../0331-PR-target-49128.patch                     |   23 +
>  .../gcc-4_6-branch-backports/0332-PR-c-48292.patch |   71 +
>  .../gcc-4_6-branch-backports/0333-PR-c-45080.patch |   59 +
>  .../gcc-4_6-branch-backports/0334-PR-c-45418.patch |   50 +
>  .../gcc-4_6-branch-backports/0335-PR-c-48935.patch |   76 +
>  ...arm-fp16-compile-none-1.c-Update-expected.patch |   74 +
>  .../gcc-4_6-branch-backports/0337-PR-c-47184.patch |   64 +
>  .../gcc-4_6-branch-backports/0338-PR-c-46696.patch |   48 +
>  .../gcc-4_6-branch-backports/0339-PR-c-46245.patch |   88 +
>  .../gcc-4_6-branch-backports/0340-PR-c-46145.patch |   37 +
>  .../gcc-4_6-branch-backports/0341-PR-c-45698.patch |   44 +
>  .../gcc-4_6-branch-backports/0342-PR-c-44311.patch |  125 +
>  .../0343-gcc-cp-ChangeLog.patch                    |  207 +
>  ...25-Paolo-Carlini-paolo.carlini-oracle.com.patch |   76 +
>  ...25-Paolo-Carlini-paolo.carlini-oracle.com.patch |   78 +
>  .../gcc-4_6-branch-backports/0347-PR-c-45401.patch |   51 +
>  .../gcc-4_6-branch-backports/0348-PR-c-49156.patch |   62 +
>  .../0349-PR-tree-optimization-49161.patch          |  200 +
>  .../gcc-4_6-branch-backports/0350-PR-c-49165.patch |   89 +
>  .../0351-PR-target-44643.patch                     |   44 +
>  .../gcc-4_6-branch-backports/0352-PR-c-48424.patch |  105 +
>  .../0353-fix-pr-marker.patch                       |    7 +
>  ...00-rs6000.c-rs6000_register_move_cost-Mak.patch |   28 +
>  ...-2011-05-26-Paul-Thomas-pault-gcc.gnu.org.patch |  168 +
>  .../gcc-4_6-branch-backports/0357-PR-c-48657.patch |  149 +
>  .../gcc-4_6-branch-backports/0358-PR-c-49165.patch |   89 +
>  .../gcc-4_6-branch-backports/0359-PR-c-48284.patch |   40 +
>  .../gcc-4_6-branch-backports/0360-PR-c-47277.patch |   38 +
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106746.patch    |   24 +
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106747.patch    |  640 +++
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106750.patch    |   30 +
>  .../gcc/gcc-4_6-branch-backports.inc               |  133 +-
>  .../gcc/gcc-4_6-branch-linaro-backports.inc        |    3 +
>  299 files changed, 25391 insertions(+), 162 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0201-PR-tree-optimization-48809.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0202-2011-04-30-Paul-Thomas-pault-gcc.gnu.org.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0203-2011-04-30-Jerry-DeLisle-jvdelisle-gcc.gnu.org.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0205-2011-04-30-Doug-Kwan-dougkwan-google.com.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0207-Backport-from-mainline.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0209-PR-target-48723.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0210-2011-05-03-Richard-Guenther-rguenther-suse.de.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0211-PR-target-48774.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0212-2011-05-03-Paolo-Carlini-paolo.carlini-oracle.com.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0214-include-ext-sso_string_base.h-__sso_string_base-_M_c.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0215-config-i386-i386.md-movdi_internal_rex64-TYPE_SSEMOV.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0216-2011-05-04-Steven-G.-Kargl-kargl-gcc.gnu.org.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0218-PR-c-48749.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0219-Backport-from-mainline.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0220-gcc.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0221-PR-ada-48844.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0222-PR-c-40975.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0223-Add-missing-break-for-OPT_mfpu_-case.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0224-2011-05-06-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0226-Fix-PR-c-48838.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0227-PR-fortran-48894.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0228-2011-05-06-Ramana-Radhakrishnan-ramana.radhakrishnan.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0229-2011-05-06-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0230-PR-target-48900.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0231-config-i386-i386.md-movdf_internal_nointeger-Apply.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0232-PR-c-48089.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0233-PR-c-48446.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0234-PR-c-48911.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0235-PR-c-48909.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0239-var-tracking.c-find_mem_expr_in_1pdv-Fix-thinko.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0240-Fix-PR-c-48574.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0241-2011-05-09-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0242-2011-05-09-Paolo-Carlini-paolo.carlini-oracle.com.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0244-PR-tree-optimization-48611.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0245-Backported-from-mainline.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0246-config-rx-rx.h-JUMP_ALIGN-LABEL_ALIGN-LOOP_ALIGN-Def.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0247-Fix-typo.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0248-config-rx-rx.c-rx_memory_move_cost-Reduce-the-cost-f.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0249-Fix-PRs-48857-48495.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0251-gcc-cp-ChangeLog.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0252-PR-debug-48159.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0253-2011-05-11-Tobias-Burnus-burnus-net-b.de.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0255-pt.c-build_non_dependent_expr-Don-t-check-null_ptr_c.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0256-config-rx-rx.h-HAVE_PRE_DECREMENT-Fix-typo.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0257-zh_CN.po-Update.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0258-PR-debug-48967.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0259-2011-05-12-Richard-Guenther-rguenther-suse.de.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0260-PR-tree-optimization-48975.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0263-zh_CN.po-Update.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0266-config-i386-i386.md-movxf_internal-Disable-CONST_DOU.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0267-PR-preprocessor-48677.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0269-PR-target-48986.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0270-config-rx-rx.md-Add-peephole-to-remove-redundant-ext.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0271-config-rx-rx.c-rx_memory_move_cost-Include-cost-of-r.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0273-PR-tree-optimization-49000.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0274-PR-tree-optimization-49000.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0275-2011-05-18-Richard-Guenther-rguenther-suse.de.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0276-2011-05-18-Richard-Guenther-rguenther-suse.de.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0277-2011-05-18-Richard-Guenther-rguenther-suse.de.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0278-PR-tree-optimization-49039.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0279-Properly-handle-256bit-load-cast.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0281-PR-c-48869.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0282-gcc.c-torture-execute-960321-1.x-Remove.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0283-zh_CN.po-Update.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0284-PR-c-49043.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0285-2011-05-19-Uros-Bizjak-ubizjak-gmail.com.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0287-PR-tree-optimization-49073.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0288-2011-05-20-Richard-Guenther-rguenther-suse.de.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0289-PR-bootstrap-49086.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0290-PR-c-48873.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0291-PR-c-48736.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0292-PR-c-48745.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0293-semantics.c-register_constexpr_fundef-Add-to-hash-ta.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0294-semantics.c-validate_constexpr_fundecl-Check-DECL_TE.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0295-PR-c-48948.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0296-DR-1073.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0298-In-gcc-objc.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0299-PR-c-49066.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0300-config-sparc-sparc.c-eligible_for_return_delay-Do-no.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0301-config-sparc-sparc.md-setjmp-Handle-PIC-mode-and-use.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0303-PR-c-48780.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0304-PR-c-48945.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0305-PR-middle-end-49029.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0306-PR-target-49104.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0307-config.gcc-sparc-elf-Add-sparc-t-crtin.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0308-PR-c-48647.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0309-2011-05-22-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0311-PR-middle-end-48973.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0312-PR-c-49120.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0313-PR-debug-49032.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0314-PR-lto-49123.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0316-Always-add-mno-XXX-for-march-native.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0317-PR-target-49133.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0318-config-sparc-sparc.c-sparc_option_override-If-not-se.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0320-PR-c-48617.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0321-PR-c-47544.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0322-PR-c-47336.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0323-PR-c-47263.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0324-PR-c-49105.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0325-PR-c-48884.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0326-PR-c-49042.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0327-PR-c-49136.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0328-In-libobjc.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0329-2011-05-24-Paolo-Carlini-paolo.carlini-oracle.com.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0330-PR-tree-optimization-44897.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0331-PR-target-49128.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0332-PR-c-48292.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0333-PR-c-45080.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0334-PR-c-45418.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0335-PR-c-48935.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0336-gcc.target-arm-fp16-compile-none-1.c-Update-expected.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0337-PR-c-47184.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0338-PR-c-46696.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0339-PR-c-46245.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0340-PR-c-46145.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0341-PR-c-45698.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0342-PR-c-44311.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0343-gcc-cp-ChangeLog.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0344-2011-05-25-Paolo-Carlini-paolo.carlini-oracle.com.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0345-2011-05-25-Paolo-Carlini-paolo.carlini-oracle.com.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0347-PR-c-45401.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0348-PR-c-49156.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0349-PR-tree-optimization-49161.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0350-PR-c-49165.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0351-PR-target-44643.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0352-PR-c-48424.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0353-fix-pr-marker.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0354-config-rs6000-rs6000.c-rs6000_register_move_cost-Mak.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0355-2011-05-26-Paul-Thomas-pault-gcc.gnu.org.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0357-PR-c-48657.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0358-PR-c-49165.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0359-PR-c-48284.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/gcc-4_6-branch-backports/0360-PR-c-47277.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106746.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106747.patch
>  create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106750.patch

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN4Ki6MkyGM64RGpERAmJSAJ97cUPba1xijIm5Axl9vPK/Q6FKowCdElGa
v8q7SJto//tVe5T0XDyYQEE=
=ET/i
-----END PGP SIGNATURE-----



