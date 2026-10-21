Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8888.1792580518783476491
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AGtAyYFh;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so436195f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580517; x=1793185317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9sEQOTCytTnlIYAxsvKaKhNgglBPKXt+c4cKgmUkeY=;
        b=AGtAyYFhBc9xl4rrBmPCfsn6Z5PmTZP+jLN+BF/gidSmi7clRoW1AAEFqL6L4hBr1Q
         ZQoNrTHq0h+0y3k492nssJMDByB76iiU2oqXzFKELXUDCbel1h3JoZJTpH35IytUbMvw
         hpwWobpb8SUjda5VhRgKWU3L5s0wZI0uJKob4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580517; x=1793185317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9sEQOTCytTnlIYAxsvKaKhNgglBPKXt+c4cKgmUkeY=;
        b=JHKzWhtxKWdQLGd9PiXIxuGirNZbRjxerA5mHsFeCV/ScWXIuh4P/XHFb2dSUFK9Cb
         dcrqJ0QGhMo3EMRFqYzZkp7uRIgT10NtekpF4P8s4zDlYgFh6ebs3/3oi9HHIVpaQhfO
         u+apYHJyIBqyDYuaAAPKcdDiZWU1miCWLGak8WQefHIVFLvpJGrZc7VO1LoelLJc6Ycl
         GlfZNEQX5AAfCrQFAHA3/V6CE5dpQr4m5wF6Fuyy/OvSVmSYTQfzx7IBx4KpiwO0kbga
         X4NNep16vQVOLPFKz1N8xbVLBHwfWdnAxsjKUt+4KjE/fEdli0AL8n5iyQLZipmVO17E
         vZ3Q==
X-Gm-Message-State: AFq9FYIZpf/TMgabRehenLCjAW+VzHeAAW45ZllwSZFIW3LKGbAGyJjM
	WqdKj6L0/6myIptiUm7Qmfu/t/5feLTtv+JqwQQEiOZq5/imNLZFDfqUM6qqIgUNVEh6FgM6vuC
	2l8EA
X-Gm-Gg: AYBFou381NxjR8tMZZsJmxXb5qhvLEmsqi0JgghU1Znmys2r2bFCnCJBc3mFY9AGIaX
	JZP+MC9If+Sn5pJRDcKusM8Qxz2LW+WqUADSLVVf/saTudP2xkL584LKo8rVJDPBd33mUjy7KAU
	x3mEAsuSzBWjJ35Nk5At7fFQ3YlRCGDkidjHS5tyHBPKMWPjlbHwjJ08dVeEHFLvW/DDKewaNNN
	LhCrbfjP9cUmmaJDUbVSwLv9q+WuRWQf9ByGkVH6LqvVPgFf9vDt7leWYulAKXrDF9OHZIGWJIZ
	ixMFaez3vtjwFBBlWJXV5yBAPzLHKXUAP99spATTv8dW4i5H/kITEU2yONtEAvO2BLGMYqCSvHj
	zYuALiYrEAA3rUM5oyjuo2A7jsyq+M8aEZsOgQyvJoJAFJtKYunqA10OMd6+wHjAorxmczTdPM0
	zm5bn89XVl962dlA5oAkWbQ1zqPL7sIjezFOy0WHyXZwEaFAR36oSKVo4gCl3pYzfuvNQfpPMxK
	MO4iYiL6hrquPvV6vj90HBGzbjrNs8BHI8Yjjz8i4CdqlO7eb3m2udHdD7uzQfaxfaCMTqbr8Z4
	B3MMG+KR1r0ZdHoDQiimAEepKv0eM89zTrtU/jE9inXc/54uN3WXg9mJvj9xjpTvt+E67iWzIPn
	6pKF8
X-Received: by 2002:a5d:5603:0:b0:488:8da2:4b0e with SMTP id ffacd0b85a97d-48e264d3290mr2987608f8f.21.1792580516766;
        Wed, 21 Oct 2026 04:01:56 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:55 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 29/36] python3-networkx: Upgrade 3.6.1 -> 3.7
Date: Wed, 21 Oct 2026 14:00:53 +0300
Message-ID: <20261021110103.1943456-29-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:02:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131288
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.7:

Highlights:

- The isomorphism checking suite of tools has been upgraded. The
  VF2++ functions now provide subgraph isomorphism and subgraph
  monomorphism checking.
- Leiden based community detection algorithms are now supported via
  leiden_communities and leiden_partitions. This provides an
  alternative, often improved, community detection algorithm
  compared to the Louvain functions.
- The pygraphviz library is now provided via pip with wheels that
  include the GraphViz binaries. This should make the NetworkX
  interface to pygraphviz easier to use for graph layout and
  rendering.

API Changes:

- Expire random lobster dep.
- API: Expire deprecations of could-be isomorphism aliases.
- Proposal to deprecate bfs_predecessors.
- Change maximal_independent_set to return set instead of list
 .
- Add centroid as alias to barycenter.
- API: Deprecate p2g module.

Enhancements:

- Adding the Tree Optimization in Floyd Warshall.
- Kruskal MST early break for efficiency.
- create new generator that returns a random k-lift of a d-regular
  graph.
- Floyd Warshall: Adding support for weight parameter as a callable.
- [ENH] Flow algorithms: Add support for callable capacity
  parameter.
- fix: add suggestions from #8021 and #8029 to is_aperiodic.
- Improve chordal code readability by removing helper function.
- FEAT: Added basic random walk utilities #8378.
- Implement Constant-Potts Model (for use with Leiden community
  detection).
- The isomorphism checking suite of tools has been upgraded. The
  VF2++ functions now provide subgraph isomorphism and subgraph
  monomorphism checking.
- Adding optional sp arg to closeness_centrality.
- perf: replace built-in sum() with np.sum() in pagerank and katz.
- ENH: Add format parameter to adjacency_matrix.
- Proposal: Add density to nx.describe defaults.
- Add utility to extract faces from PlanarEmbedding.
- Improving views exceptions.
- Optimize _build_paths_from_predecessors stack logic for 30-40%
  speedup.
- EHN: Add nonedge argument to from_numpy_array and complete the
  roundtrip.
- State-of-the-art implementation of Tarjan's algorithm.
- Add description and keywords support to GEXF reader/writer.
- DOC: more barycenter and centroid equivalence.
- ENH: Add Barber's bipartite modularity quality function.
- Leiden based community detection algorithms are now supported via
  leiden_communities and leiden_partitions. This provides an
  alternative, often improved, community detection algorithm
  compared to the Louvain functions.
- ENH: Add Shen's overlapping modularity quality function.
- ENH: leiden test and doc_string improvements.
- Add butterflies() to bipartite cluster module.
- Avoid O(E) lookup in nx.display -issue8639.
- Add HITS algorithm benchmark to benchmark suite.
- Add DAG antichain width.
- escape tuple labels in generate_gml.
- Speed up the residual flow reset in edmonds_karp and simplify the
  minimum_cut partition.
- Avoid building the flow dict in maximum_flow_value.
- ENH: add n_samples parameter to rich_club_coefficient for
  multi-sample averaging.
- Simplifying _build_paths_from_predecessors - 10% faster.
- {label=Highlight} The isomorphism checking suite of tools has
  been upgraded. The ISMAGS symmetry aware isomorphism and subgraph
  isomorphism checking tools now support directed and multigraph
  Graphs. And, now in addition to support for (induced) subgraph
  isomorphisms, they support (non-induced subgraph) monomorphism.
- ENH: adding magnetic_laplacian_matrix.
- ENH: Speed up connectivity checks in random_reference and
  lattice_reference.
- [BUG][PERF] Fix ISMAGS directed matching and monomorphism
  overhead.
- Add: Shrikhande graph.

Bug Fixes:

- Bug: Floyd Warshall: resolved self positive loop bug.
- Bugfix for spring layouts with empty list of fixed nodes.
- Fixed diameter/radius error for null graphs.
- Floyd warshall: raises error if negative cycle is found.
- BUG: fix ISMAGS self-loops error.
- Fix cost function in min_weighted_dominating_set.
- Fix sparse heuristic not applied to diagonal blocks in
  stochastic_block_model.
- BUG: fix SpanningTreeIterator AttributeError when using next()
  directly.
- Fix all_node_cuts: correct Even-Tarjan reduction for Kanevsky's
  algorithm.
- fix multigraph isomorphism tests and fix support in ISMAGS and in
  VF2pp.
- BUG: Make argmap._lazy_compile thread-safe.
- reject out-of-range bytes in graph6/sparse6 decoders.
- Fix: bug with mean degree part of
  geometric_soft_configuration_model.
- Fix k_components losing or truncating k-components.
- Fix ISMAGS ignoring matches when graph has extra node/edge colors
  (gh-8738).
- BUG: reverse the map returned by vf2pp functions.
- BUG: Fix node connectivity and node cuts for digraphs.
- BUG: Use power iteration as the default HITS implementation.
- BUG: group betweenness gives incorrect values for undirected
  connected graph.
- BUG: Group betweenness centrality counts paths incorrectly for
  directed but not strongly connected.
- BUG: Group betweenness skips adjustments if any sigma is zero.
- BUG: Handle KeyErrors in directed not strongly-connected
  group_betweenness_centrality.
- BUG: correct normalization of group betweenness centrality when
  endpoints is true.
- [BUG][PERF] Fix ISMAGS directed matching and monomorphism
  overhead.
- BUG: Fix vf2 handling of isomorphism_iter with isolated subgraph
  nodes.
- fix: handle empty candidate sets in
  ISMAGS.largest_common_subgraph.
- BUG: Hold the graph weakly in cached edge and degree views.

Documentation:

- Improving FP recommendations.
- DOC: add Reporting Views reference page and include in toctree.
- Betweenness documentation definitions should match default
  behavior.
- docs: clarify chordal_cycle_graph degree for multigraph vs simple
  graph.
- DOC: dedup graph setup in fp tutorial cells.
- Clarify decorator usage in backend implementations.
- DOC: Warn that env vars must be set before importing networkx.
- Update PGF/TikZ link.
- Consolidate reportviews documentation.
- Document betweenness normalizations correctly.
- DOC: Add nx-guides cross-link to plot_lca example.
- DOC: Update link to football data.
- Clarify that bfs_predecessors() does not actually search through
  predecessors.
- Add example to filter multiedges in edge_subgraph docstring.
- Doc: Add nx_pydot to DOT file documentation.
- Adopt scikit-learn's agentic AI policy.
- Clarify a note on graph ordering in graph_atlas_g docstring.
- DOC: Update import convention for bipartite docstring examples.
- DOC: Use dict(G.degree) in examples.
- Fix typo: thrid-party to third-party in tutorial.
- Fix: minor typo in docstring.
- DOC: Add docstring examples to random_walk.
- DOC: first step to add football.zip to examples directory.
- DOC: Add football example using url to our own examples github
  folder.
- DOC: Remove Good First Issue references from docs.
- DOC: Add note about from_scipy_sparse_array treating zeros as
  explicit zeros.
- Update maximal_independent_set docstring.
- Add examples to degree_histogram docstring.
- Gallery: Fix and update basic_properties example.
- Added example for SpanningTreeIterator to find min spanning trees.
- Gallery: Update basic read/write example.
- Gallery: split simple graph example into two separate ones.
- Fix broken links in quotient_graph docstring and other minor doc
  warnings.
- Gallery: Improve plot_dag example.
- Gallery: Improve plot_degree_sequence example.
- Enhance has_cycle docstring with usage examples.
- DOC: Remove redundant sphinx links.
- DOC: clarify lazy exception behavior in topological_sort
  generator.
- Fixed incorrect description of modularity formula for directed
  graphs.
- DOC: clarify remaining readwrite generator docstrings.
- DOC: Add note about connectionstyle effectiveness.
- DOC: more barycenter and centroid equivalence.
- DOC: Add xref to nx-guides to gallery overview.
- DOC: Add conference information to visualization in football
  example.
- leiden: fix "wen" + duplicate "the the" in q_add comment.
- Fix star graph node count in dual_barabasi_albert_graph comment.
- DOC: update to roadmap.
- DOC: Clarify degree_centrality behavior for directed graphs.
- DOC: Fixups for Leiden docstrings.
- DOC: Update install guide.
- Louvain updates to docs and code readability.
- DOC: Add Hiveplotlib to Drawing Docs and External Examples
  Gallery.
- Clarify attribute behavior in relabel_nodes when multiple nodes
  map to the same target.
- MAINT: update code of conduct form link to match NumFOCUS link.
- Warn when PageRank convergence check is ineffective.
- DOC: fix lattice_reference niter default (5, not 1).
- Fix typos in comments and docstrings.
- DOC: Add example of floating point handling for maximum_flow
  capacity.
- DOC: minor tweaks to biconnected docstring examples.
- BUG: fix bfs_successors yielding empty tuple for zero-successor
  source.
- DOC: clarify method='unweighted' behavior in all_shortest_paths
  helpers.
- Fix docstring parameters that are not in the signature.
- Raise NetworkXError on unknown attribute class in GEXF reader.
- DOC: add example of immediate post-dominators.
- Fix four docstring parameter names that do not match the
  signature.
- DOC: Add details about steiner tree approxmation for disconnected
  graphs.
- DOC: Fix broken link in leiden_partitions.
- DOC: Fixup communicability.
- DOC: document bfs_layout raises.
- Add and correct ISMAGS method docs.
- DOC: Fix write graphml docstring examples.
- DOC: Fix edgelist docstring examples.
- DOC: Fix TeX docstring examples.
- DOC: Fixing adjlist docstring examples.
- DOC: Fix gexf docstring examples.
- DOC: Fixing bipartite.write_edgelist docstring examples.
- DOC: Fix pajek docstring examples.
- DOC: Update bipartite.read_edgelist docstring examples.
- DOC: Fix multiadjlist docstring examples.
- DOC: Fix gml docstring examples.
- [BUG][PERF] Fix ISMAGS directed matching and monomorphism
  overhead.
- DOC: Fix Parameters indentation in generate_gexf.
- Expose *Matcher classes to get them into the objects inventory.

Maintenance:

- Relaxes check for undirected edge node ordering when backends are
  used for networkx tests.
- Revert "pin python 3.14 to be version 3.14.0 until dataclasses
  are fixed".
- MAINT: Single implementation for different returns.
- CI: Build docs in parallel.
- BENCH: Add minimum spanning tree to benchmarks.
- fix: circular_ladder_graph edge cases for n < 2.
- Fix/refactor dag root to leaf.
- fix: preserve string positions in to_agraph conversion.
- BUG: forceatlas2 layout with nonarray complete initial positions.
- Add benchmarks for is_chordal.
- Explicitly install nx after deps.
- Minor improvements to chordal_graph_treewidth.
- DOC: Eliminate sphinx build warnings.
- CI: Bump dispatch workflow python version.
- Update minimum dependencies (SPEC 0) and drop python 3.11.
- Remove _hits_scipy code that has been deprecated.
- DOC: footnote -> hyperlink.
- Linting exceptions.
- BUGFIX: spring energy and ARF layouts with zero iterations.
- Expire random lobster dep.
- MAINT: Reuse could_be_isomorphic in fast_/faster_ variants.
- API: Expire deprecations of could-be isomorphism aliases.
- MAINT: Bump linters.
- CI: Use pixi for CI platform/OS independent tasks.
- CI: Explicitly add pip as a dep while resolving doc env.
- Minor random_walks test refactor.
- Refactor random walk implementation.
- Minor update to zip examples.
- TST: Dedup and refactor closeness centrality tests.
- MAINT: clarify error when RandomState is used with random API.
- MAINT: remove unused functions and imports.
- MAINT: Minor readability tweaks to pagerank.
- Raise ValueError in write_gexf for mixed typed attributes.
- BUG: Handle small graphs in information_centrality.
- CI: fix benchmark PR workflow checkout.
- Followup that fixes import order.
- MAINT: remove unused imports and dead helpers.
- MAINT: Handle insufficient degree Pearson samples.
- Optimize VF2 GMState frontier update by removing full core scan.
- MAINT: Avoid subgraph views in strategy_connected_sequential.
- Cleanup butterflies tests.
- Remove unused dsum variable from havel_hakimi_graph.
- CI: networkx default deps were leaking into the pixi default env.
- DOC/CI: Update github label requirements for user experience.
- CI: Redo benchmarks to use pixi around asv.
- MAINT: Fix ci permissions.
- MAINT: Minor touchups to lexicographical_toplogical_sort.
- MAINT: Rm MANIFEST.in.
- CI: Add image comparison tests to pre-release workflows.
- MAINT: Avoid subgraph views in is_forest.
- TST, MAINT: explict graphviz check for test_pydot.
- CI: Fix circleci artifact redirector permissions.
- write xsd:boolean true/false for dynamic gexf attvalues.
- escape quotes and backslashes in pajek make_qstr.
- Louvain updates to docs and code readability.
- Align boruvka_mst_edges keys default with kruskal/prim and fix
  docstring typo.
- TST: Test maintenance for test_clique.py.
- Optimize Leiden data handling.
- MAINT: Avoid Louvain infinite loops.
- MAINT: avoid timeouts on circleci.
- MAINT: bump copyright year before release.
- BENCH: Add clustering to algorithm benchmarks.
- CI: Add back --doctest-modules flag to base tests.
- Prune nested components in k_components reconstruction and add
  tests the private helpers.
- Fix reverse to preserve all attributes in dispatch conversions.
- Clear the dispatch cache in remove_{node,edge}_attributes.
- Fix "accidentally quadratic" use of list as queue in
  full_rary_tree.
- MAINT: allow isomorphism match helpers to be lists or not.
- fix: correct typo in test variable name.
- Allow spectral_layout to handle dim>=len(G). Added dim tests.
- META: Add agents.md.
- MNT: Use linalg.eigh to compute HITS eigenvalues.
- TST: parameterizing with iterables is deprecated in pytest.
- TST: Cleanup & modernize the minimum cuts test suite.
- MAINT: Refactor communicability tests.
- ENH: Use linear algebra to compute communicability.
- MNT: Raise warnings to errors while running pytest.
- MAINT: sparse.eye is deprecated, use eye_array.
- BUG: Fix _hits_numpy inf/NaN when eigh returns negated
  eigenvector.
- Fix typo while dispatching vf2pp.
- Support for Py3.15.
- Update minimum dependencies (SPEC 0).

Other:

- TST: Common tests for all isomorphism algorithms.
- TST: Add test cases for len(G) != 3.
- TST: shorten leiden tests.
- TST: Update pytest-mpl baselines for matplotlib v3.11.
- Adding regression test for duplicate shortest-paths.

License-Update: Copyright years updated

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-networkx_3.6.1.bb          | 23 ----------
 .../python/python3-networkx_3.7.bb            | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-networkx_3.6.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-networkx_3.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-networkx_3.6.1.bb b/meta-python/recipes-devtools/python/python3-networkx_3.6.1.bb
deleted file mode 100644
index fe08ae9968..0000000000
--- a/meta-python/recipes-devtools/python/python3-networkx_3.6.1.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Python package for creating and manipulating graphs and networks"
-HOMEPAGE = "http://networkx.github.io/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f7592b173aee2da0e062f9cfa0378e9d"
-
-SRC_URI[sha256sum] = "26b7c357accc0c8cde558ad486283728b65b6a95d85ee1cd66bafab4c8168509"
-
-inherit pypi python_setuptools_build_meta
-
-RDEPENDS:${PN} += "\
-                   python3-decorator \
-                   python3-netclient \
-                   python3-compression \
-                   python3-numbers \
-                   python3-pickle \
-                   python3-html \
-                   python3-xml \
-                   python3-json \
-                   python3-profile \
-                   python3-threading \
-                   "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-networkx_3.7.bb b/meta-python/recipes-devtools/python/python3-networkx_3.7.bb
new file mode 100644
index 0000000000..5e37a97543
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-networkx_3.7.bb
@@ -0,0 +1,45 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.txt
+# +++ LICENSE.txt
+# @@ -2,7 +2,7 @@
+#  
+#  ::
+#  
+# -   Copyright (c) 2004-2025, NetworkX Developers
+# +   Copyright (c) 2004-2026, NetworkX Developers
+#     Aric Hagberg <hagberg@lanl.gov>
+#     Dan Schult <dschult@colgate.edu>
+#     Pieter Swart <swart@lanl.gov>
+# 
+#
+
+DESCRIPTION = "Python package for creating and manipulating graphs and networks"
+HOMEPAGE = "http://networkx.github.io/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4ccf59069a708419c8b37163831a4228"
+
+SRC_URI[sha256sum] = "fd77a511bd90f39f3d016351345b52cf5319b813bdca01de3f755d3cca62e96a"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += "\
+                   python3-decorator \
+                   python3-netclient \
+                   python3-compression \
+                   python3-numbers \
+                   python3-pickle \
+                   python3-html \
+                   python3-xml \
+                   python3-json \
+                   python3-profile \
+                   python3-threading \
+                   "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

